import 'package:filamentor_app/common/base/base_page_store.dart';
import 'package:filamentor_app/config/app_router.dart';
import 'package:filamentor_app/config/app_router.gr.dart';
import 'package:filamentor_app/data/network/api_result.dart';
import 'package:filamentor_app/data/network/models/index.dart';
import 'package:filamentor_app/data/network/printer_client.gen.dart';
import 'package:filamentor_app/data/network/sys_client.gen.dart';
import 'package:filamentor_app/data/storage.gen.dart';
import 'package:injectable/injectable.dart';
import 'package:lce/lce.dart';
import 'package:mobx/mobx.dart';

part 'printer_setting_page_store.gen.g.dart';

@injectable
class PrinterSettingPageStore = PrinterSettingPageStoreBase with _$PrinterSettingPageStore;

abstract class PrinterSettingPageStoreBase extends BasePageStore with Store {
  final Storage storage;
  final SysClient sysClient;
  final PrinterClient printerClient;
  final AppRouter router;

  PrinterSettingPageStoreBase(this.sysClient, this.printerClient, this.router, this.storage) {
    loadData();
  }

  @computed
  @override
  bool get progress => super.progress || fetchConfig.pending || fetchDelete.pending || fetchAddPrinter.pending;

  @observable
  String ip = '';

  @observable
  String lanPWD = '';

  @observable
  String deviceSerial = '';

  @observable
  String alias = '';

  @observable
  var fetchConfig = OBF<ApiResult<RespConfig>>();

  @observable
  var fetchDelete = OBF<ApiResult>();

  @observable
  var fetchAddPrinter = OBF<ApiResult>();

  var printerId = '';

  @action
  Future<void> loadData() async {
    fetchConfig = sysClient.getConfig().obf;
    final ret = await fetchConfig;
    if (ret.isSuccess == false) {
      showMessage('获取打印机信息失败');
      return;
    }
    final config = ret.data;
    //TODO: 这里写死了打印机ID
    ip = config.printerList[0].info.printerIp;
    lanPWD = config.printerList[0].info.lanPassword;
    deviceSerial = config.printerList[0].info.deviceSerial;
    printerId = config.printerList[0].id;
    alias = config.printerList[0].alias;
  }

  @action
  Future<void> delete() async {
    fetchDelete = printerClient.remove(printerId).obf;
    final ret = await fetchDelete;
    if (ret.isSuccess) {
      showMessage('删除成功');
      router.pushAndPopUntil(const PrinterRoute(), predicate: (e) => false);
      return;
    }

    showMessage('删除失败');
  }

  @action
  Future<void> create(String ip, String lanPWD, String deviceSerial, String alias) async {
    fetchAddPrinter = printerClient
        .add(
          alias,
          255, // TODO: 这里写死了换色温度
          'bambu_client', //TODO: 这里写死了打印机类型
          RespPrinterBambuInfo(
            printerIp: ip,
            lanPassword: lanPWD,
            deviceSerial: deviceSerial,
          ).toJson(),
        )
        .obf;

    final ret = await fetchAddPrinter;
    if (ret.isSuccess) {
      showMessage('添加成功');
      router.popForced(1);
      return;
    }
    showMessage('添加失败${ret.message}');
  }
}
