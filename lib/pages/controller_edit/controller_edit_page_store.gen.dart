import 'package:filamentor_app/common/base/base_page_store.dart';
import 'package:filamentor_app/config/app_router.dart';
import 'package:filamentor_app/data/network/api_result.dart';
import 'package:filamentor_app/data/network/controller_client.gen.dart';
import 'package:filamentor_app/data/network/models/index.dart';
import 'package:injectable/injectable.dart';
import 'package:lce/anotations.dart';
import 'package:lce/lce.dart';
import 'package:mobx/mobx.dart';

part 'controller_edit_page_store.gen.g.dart';

@injectable
class ControllerEditPageStore = ControllerEditPageStoreBase with _$ControllerEditPageStore;

abstract class ControllerEditPageStoreBase extends BasePageStore with Store {
  final ControllerClient controllerClient;
  final AppRouter appRouter;

  ControllerEditPageStoreBase(
    this.controllerClient,
    this.appRouter,
  );

  @computed
  @override
  bool get progress => super.progress || fetchAddController.pending;

  @observable
  var fetchAddController = OBF<ApiResult>();

  @LCECatch(message: '创建失败')
  @action
  Future<void> create(String type, String name, String ip, int totalChannel) async {
    fetchAddController = controllerClient
        .add(
          name,
          type,
          //TODO: 这里写死固定 YBA-AMS 类型了，后续需要优化
          YbaAmsInfo(ip: ip, port: 3333, channelTotal: totalChannel).toJson(),
        )
        .obf;
    await fetchAddController;
    showMessage('创建成功');
    appRouter.popForced(true);
    return;
  }
}
