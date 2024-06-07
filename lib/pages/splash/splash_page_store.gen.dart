import 'package:dio/dio.dart';
import 'package:filamentor_app/common/base/base_page_store.dart';
import 'package:filamentor_app/config/app_router.dart';
import 'package:filamentor_app/config/app_router.gr.dart';
import 'package:filamentor_app/config/constants.dart';
import 'package:filamentor_app/data/storage.gen.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'splash_page_store.gen.g.dart';

@injectable
class SplashPageStore = SplashPageStoreBase with _$SplashPageStore;

abstract class SplashPageStoreBase extends BasePageStore with Store {
  final Dio dio;
  final Storage storage;
  final AppRouter router;

  /// 数据加载完毕
  @observable
  bool dataLoaded = false;

  /// 全部加载完毕
  @computed
  bool get success => dataLoaded;

  SplashPageStoreBase(this.dio, this.storage, this.router) {
    loadData();
  }

  @action
  Future loadData() async {
    dataLoaded = true;

    if (!kIsWeb) {
      if (storage.filamentorUrl.isEmpty) {
        router.replace(ServerSettingRoute(goback: 0));
        return;
      }

      dio.options.baseUrl = Constants.baseUrl(server: storage.filamentorUrl, port: storage.filamentorPort);
    }

    // router.replace(const PrinterRoute());

    Future.delayed(const Duration(seconds: 1)).then((_) {
      router.replace(const PrinterRoute());
    });
  }
}
