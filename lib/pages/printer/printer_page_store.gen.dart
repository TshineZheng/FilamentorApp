import 'dart:async';
import 'dart:ui';

import 'package:filamentor_app/common/base/base_page_store.dart';
import 'package:filamentor_app/config/app_router.dart';
import 'package:filamentor_app/data/network/api_result.dart';
import 'package:filamentor_app/data/network/controller_client.gen.dart';
import 'package:filamentor_app/data/network/models/index.dart';
import 'package:filamentor_app/data/network/printer_client.gen.dart';
import 'package:filamentor_app/data/network/sys_client.gen.dart';
import 'package:filamentor_app/models/channel.gen.dart';
import 'package:filamentor_app/models/controller.gen.dart';
import 'package:filamentor_app/models/detector.gen.dart' as printer_detector;
import 'package:filamentor_app/models/mqtt_filament_broken_detector.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:injectable/injectable.dart';
import 'package:lce/anotations.dart';
import 'package:lce/lce.dart';
import 'package:mobx/mobx.dart';

part 'printer_page_store.gen.g.dart';

@injectable
class PrinterPageStore = PrinterPageStoreBase with _$PrinterPageStore;

abstract class PrinterPageStoreBase extends BasePageStore with Store {
  PrinterPageStoreBase({
    required this.sysClient,
    required this.controllerCLient,
    required this.appRouter,
    required this.printerClient,
  }) {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      sync();
    });
  }

  @computed
  @override
  bool get progress =>
      super.progress ||
      fetchConfig.pending ||
      fetchControl.pending ||
      fetchSaveCurFila.pending ||
      fetchSaveFilaChangeTemp.pending ||
      fetchUnbindChannel.pending ||
      fetchEditFilament.pending;

  @observable
  var fetchConfig = OBF<ApiResult<RespConfig>>();

  @observable
  var fetchControl = OBF<ApiResult>();

  @observable
  var fetchSaveCurFila = OBF<ApiResult>();

  @observable
  var fetchSaveFilaChangeTemp = OBF<ApiResult>();

  @observable
  var fetchSync = OBF<ApiResult<RespSync>>();

  @observable
  var fetchUnbindChannel = OBF<ApiResult>();

  @observable
  var fetchEditFilament = OBF<ApiResult>();

  final SysClient sysClient;
  final ControllerClient controllerCLient;
  final PrinterClient printerClient;
  final AppRouter appRouter;

  @observable
  RespConfig? config;

  @observable
  String printerId = '';

  @observable
  String printerIp = '';

  @observable
  String printerType = '';

  @observable
  String alias = '';

  int printerIndex = 0;

  @observable
  ObservableList<Channel> channelList = ObservableList<Channel>();

  @observable
  ObservableList<printer_detector.Detector> detectorList = ObservableList<printer_detector.Detector>();

  @observable
  int curFila = -1;

  @observable
  int filaChangeTemp = 255;

  late Timer _timer;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @retryCatch
  @action
  Future<void> loadConfig() async {
    fetchConfig = sysClient.getConfig().obf;
    final ret = await fetchConfig;
    if (ret.isSuccess == false) {
      return;
    }

    config = ret.data;

    if (config!.printerList.isEmpty) {
      printerIp = '';
      showMessage('请创建打印机');
      return;
    }

    printerId = config!.printerList[printerIndex].id;
    printerType = config!.printerList[printerIndex].type;
    filaChangeTemp = config!.printerList[printerIndex].changeTemp;

    alias = config!.printerList[printerIndex].alias;

    if (printerType == 'bambu_client') {
      printerIp = config!.printerList[printerIndex].info.printerIp;
    }

    final controllerList = controllerfromConfig(config!);

    channelList.clear();
    channelList.addAll(
      config!.channelRelations.where((e) => e.printerId == printerId).map(
            (e) => Channel(
              channel: e.channel,
              bindPrinter: printerId,
              controllerId: e.controllerId,
              controllerName: controllerList.firstWhere((element) => element.id == e.controllerId).alias,
              filamentType: e.filamentType,
              filamentColor: e.filamentColor,
            ),
          ),
    );

    detectorList.clear();
    detectorList.addAll(
      config!.detectRelations.where((e) => e.printerId == printerId).map((e) {
        for (var element in config!.detectList) {
          if (element.id == e.detectId) {
            return MqttFilamentBrokenDetector(id: e.detectId, mqttServer: element.info.mqttConfig.server);
          }
        }
        return printer_detector.Detector(id: e.detectId);
      }),
    );
  }

  @retryCatch
  @action
  Future<void> control(String controllerId, int channel, int action) async {
    //TODO：需要增加打印中判断
    fetchControl = controllerCLient
        .control(
          controllerId,
          channel,
          action,
        )
        .obf;
    await fetchControl;

  }

  @retryCatch
  @action
  Future<void> setCurFila(int value) async {
    fetchSaveCurFila = printerClient.setFilaCur(printerId, value).obf;
    await fetchSaveCurFila;
    curFila = value;
  }

  @retryCatch
  @action
  Future<void> setFilaChangeTemp(int value) async {
    fetchSaveFilaChangeTemp = printerClient.setFilaChangeTemp(printerId, value).obf;
    await fetchSaveFilaChangeTemp;
    filaChangeTemp = value;
  }

  @action
  Future<void> sync() async {
    fetchSync = sysClient.sync().obf;
    final ret = await fetchSync;
    if (ret.isSuccess) {
      for (var element in ret.data.ams) {
        if (element.printerId == printerId) {
          curFila = element.filaCur;
          break;
        }
      }

      for (var channel in channelList) {
        for (var e in ret.data.controller) {
          if (e.controllerId == channel.controllerId) {
            if (channel.channel < e.channelStates.length) {
              channel.state = e.channelStates[channel.channel];
            }
            break;
          }
        }
      }

      for (var detector in detectorList) {
        for (var e in ret.data.detect) {
          if (e.detectId == detector.id) {
            detector.isBroken = e.isBroken;
            break;
          }
        }
      }
    }
  }

  @action
  Future<void> refresh(void Function(String msg) onDone) async {
    try {
      await loadConfig();
      await sync();
      onDone.call('刷新成功');
    } catch (e) {
      onDone.call('刷新失败');
    }
  }

  @action
  Future<void> unbindChannel(controllerId, channel) async {
    fetchUnbindChannel = controllerCLient
        .unbind(
          printerId,
          controllerId,
          channel,
        )
        .obf;
    final ret = await fetchUnbindChannel;
    if (ret.isSuccess) {
      channelList.removeWhere((element) => element.controllerId == controllerId && element.channel == channel);
    }
  }

  @action
  Future<void> editChannelFilamente({
    required Channel channel,
    required String filaType,
    required Color color,
    required int printerChannel
  }) async {
    if (channel.filamentType == filaType && channel.filamentColor.toHexString() == color.toHexString()) {
      return;
    }

    fetchEditFilament = printerClient
        .editChannelFilament(
          printerId,
          printerChannel,
          filaType,
          color.toHexString(includeHashSign: true, enableAlpha: false),
        )
        .obf;

    final ret = await fetchEditFilament;

    if (!ret.isSuccess) {
      showMessage('修改失败 ${ret.message}');
      return;
    }

    channel.filamentType = filaType;
    channel.filamentColor = color;
    showMessage('修改成功');
  }
}
