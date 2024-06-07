import 'package:filamentor_app/common/base/base_page_store.dart';
import 'package:filamentor_app/data/storage.gen.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'setting_page_store.gen.g.dart';

@injectable
class SettingPageStore = SettingPageStoreBase with _$SettingPageStore;

abstract class SettingPageStoreBase extends BasePageStore with Store {
  final Storage storage;

  SettingPageStoreBase(this.storage) {
    loadData();
  }

  @observable
  String serverUrl = '';

  @action
  Future<void> loadData() async {
    serverUrl = '${storage.filamentorUrl}:${storage.filamentorPort}';
  }
}
