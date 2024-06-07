import 'package:filamentor_app/common/base/base_page_store.dart';
import 'package:filamentor_app/data/network/api_result.dart';
import 'package:filamentor_app/data/network/controller_client.gen.dart';
import 'package:filamentor_app/data/network/models/resp_config.dart';
import 'package:filamentor_app/data/network/sys_client.gen.dart';
import 'package:filamentor_app/models/controller.gen.dart';
import 'package:injectable/injectable.dart';
import 'package:lce/lce.dart';
import 'package:mobx/mobx.dart';

part 'controller_list_page_store.gen.g.dart';

@injectable
class ControllerListPageStore = ControllerListPageStoreBase with _$ControllerListPageStore;

abstract class ControllerListPageStoreBase extends BasePageStore with Store {
  final SysClient sysClient;
  final ControllerClient controllerClient;

  ControllerListPageStoreBase(this.sysClient, this.controllerClient) {
    loadData();
  }

  @computed
  @override
  bool get progress => super.progress || fetchConfig.pending || fetchDelete.pending;

  @observable
  var fetchConfig = OBF<ApiResult<RespConfig>>();

  @observable
  var fetchDelete = OBF<ApiResult<void>>();

  @observable
  ObservableList<Controller> controllerList = ObservableList<Controller>();

  @action
  Future<void> loadData() async {
    fetchConfig = sysClient.getConfig().obf;
    final ret = await fetchConfig;
    if (ret.isSuccess == false) {
      return;
    }

    final config = ret.data;

    controllerList = controllerfromConfig(config);
  }

  @action
  Future<void> delete(String controllerId) async {
    fetchDelete = controllerClient.remove(controllerId).obf;
    final ret = await fetchDelete;
    if (!ret.isSuccess) {
      showMessage('删除失败');
      return;
    }

    showMessage('删除成功');
    loadData();
  }
}
