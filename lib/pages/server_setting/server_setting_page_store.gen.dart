import 'package:dio/dio.dart';
import 'package:filamentor_app/common/base/base_page_store.dart';
import 'package:filamentor_app/config/app_router.dart';
import 'package:filamentor_app/config/app_router.gr.dart';
import 'package:filamentor_app/config/constants.dart';
import 'package:filamentor_app/data/network/sys_client.gen.dart';
import 'package:filamentor_app/data/storage.gen.dart';
import 'package:injectable/injectable.dart';
import 'package:lce/anotations.dart';
import 'package:lce/lce.dart';
import 'package:mobx/mobx.dart';

part 'server_setting_page_store.gen.g.dart';

@injectable
class ServerSettingPageStore = ServerSettingPageStoreBase with _$ServerSettingPageStore;

abstract class ServerSettingPageStoreBase extends BasePageStore with Store {
  final SysClient configClient;
  final Storage storage;
  final Dio dio;
  final AppRouter router;

  ServerSettingPageStoreBase({
    required this.configClient,
    required this.storage,
    required this.dio,
    required this.router,
  }) {
    loadData();
  }

  @computed
  @override
  bool get progress => super.progress || fetchCheck.pending;

  @observable
  var fetchCheck = OBF<bool>();

  bool goback = true;

  @observable
  String serverUrl = '';

  @observable
  int serverPort = 0;

  @observable
  bool useSSL = false;

  @action
  Future<void> loadData() async {
    serverUrl = storage.filamentorUrl.replaceAll('http://', '').replaceAll('https://', '');
    serverPort = storage.filamentorPort;
    if (storage.filamentorUrl.startsWith('https://')) {
      useSSL = true;
    }
  }

  @StrongCatch(title: '服务器连接验证失败')
  @action
  Future<void> submit(String server, int port) async {
    fetchCheck = check(server, port).obf;
    final ret = await fetchCheck;
    if (!ret) {
      showMessage('服务器连接失败');
      return;
    }

    // TODO: 保存
    storage.filamentorUrl = server;
    storage.filamentorPort = port;

    showMessage('保存成功');

    dio.options.baseUrl = Constants.baseUrl(server: server, port: port);

    if (goback) {
      router.back();
    } else {
      router.replace(const PrinterRoute());
    }
  }

  @action
  Future<bool> check(String server, int port) async {
    final saveBaseUrl = dio.options.baseUrl;
    dio.options.baseUrl = '$server:$port/api/';
    final ret = await configClient.getConfig();
    dio.options.baseUrl = saveBaseUrl;
    if (!ret.isSuccess) {
      return false;
    }

    return true;
  }
}
