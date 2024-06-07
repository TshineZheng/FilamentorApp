import 'package:filamentor_app/common/base/base_page_store.dart';
import 'package:filamentor_app/data/network/api_result.dart';
import 'package:filamentor_app/data/network/controller_client.gen.dart';
import 'package:filamentor_app/data/network/sys_client.gen.dart';
import 'package:filamentor_app/models/channel.gen.dart';
import 'package:filamentor_app/models/controller.gen.dart';
import 'package:injectable/injectable.dart';
import 'package:lce/lce.dart';
import 'package:mobx/mobx.dart';
import 'package:tuple/tuple.dart';

import '../../data/network/models/resp_config.dart';

part 'add_channel_page_store.gen.g.dart';

@injectable
class AddChannelPageStore = AddChannelPageStoreBase with _$AddChannelPageStore;

abstract class AddChannelPageStoreBase extends BasePageStore with Store {
  final SysClient sysClient;
  final ControllerClient controllerClient;

  AddChannelPageStoreBase({required this.sysClient, required this.controllerClient}) {
    _disposers = [
      reaction((_) => unusedChannel, (v) {
        channelSelected.clear();
        for (var e in v) {
          channelSelected.add(Tuple2(e.channel, false));
        }
      }),
    ];
    loadData();
  }

  @computed
  @override
  bool get progress => super.progress || fetchConfig.pending || fetchBindChannel.pending;

  @observable
  var fetchConfig = OBF<ApiResult<RespConfig>>();

  @observable
  var fetchBindChannel = OBF<ApiResult>();

  @observable
  ObservableList<Controller> controllers = ObservableList();

  @observable
  Controller? curController;

  @observable
  ObservableList<Tuple2<int, bool>> channelSelected = ObservableList();

  @observable
  bool dateLoaded = false;

  String curPrinter = '';

  List<ReactionDisposer>? _disposers;

  @override
  void dispose() {
    _disposers?.forEach((element) => element());
    super.dispose();
  }

  @computed
  ObservableList<Channel> get unusedChannel {
    if (curController == null) ObservableList();

    ObservableList<Channel> ret = ObservableList();

    ret.addAll(controllers
        .firstWhere((e) {
          return e.id == curController!.id;
        })
        .channels
        .where((e) => e.bindPrinter.isEmpty));
    return ret;
  }

  @computed
  bool get isSelected => channelSelected.where((e) => e.item2).isNotEmpty;

  @action
  Future<void> loadData() async {
    fetchConfig = sysClient.getConfig().obf;
    final ret = await fetchConfig;
    if (ret.isSuccess == false) {
      return;
    }

    final config = ret.data;

    //TODO: 这里写死了打印机ID
    curPrinter = config.printerList[0].id;

    controllers = controllerfromConfig(config);

    curController = controllers.isEmpty ? null : controllers.first;

    dateLoaded = true;
  }

  @action
  Future<void> bind() async {
    fetchBindChannel = controllerClient
        .bindPrinter(
          curPrinter,
          curController!.id,
          channelSelected.where((e) => e.item2).map((e) => e.item1).toList(),
        )
        .obf;
    final ret = await fetchBindChannel;
    if (ret.isSuccess == false) {
      showMessage('绑定失败');
      return;
    }

    loadData();
    showMessage('绑定成功');
  }
}
