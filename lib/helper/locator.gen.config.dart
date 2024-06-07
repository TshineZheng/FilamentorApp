// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import '../config/app_router.dart' as _i4;
import '../data/network/controller_client.gen.dart' as _i8;
import '../data/network/printer_client.gen.dart' as _i9;
import '../data/network/sys_client.gen.dart' as _i10;
import '../data/storage.gen.dart' as _i5;
import '../pages/add_channel/add_channel_page_store.gen.dart' as _i16;
import '../pages/controller_edit/controller_edit_page_store.gen.dart' as _i15;
import '../pages/controller_list/controller_list_page_store.gen.dart' as _i12;
import '../pages/printer/printer_page_store.gen.dart' as _i14;
import '../pages/printer_setting/printer_setting_page_store.gen.dart' as _i17;
import '../pages/server_setting/server_setting_page_store.gen.dart' as _i13;
import '../pages/setting/setting_page_store.gen.dart' as _i6;
import '../pages/splash/splash_page_store.gen.dart' as _i11;
import 'locator.gen.dart' as _i18;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  await gh.factoryAsync<_i3.SharedPreferences>(
    () => registerModule.prefs(),
    preResolve: true,
  );
  gh.singleton<_i4.AppRouter>(() => registerModule.appRouter);
  gh.singleton<_i5.Storage>(
      () => _i5.Storage.create(gh<_i3.SharedPreferences>()));
  gh.factory<_i6.SettingPageStore>(
      () => _i6.SettingPageStore(gh<_i5.Storage>()));
  gh.singleton<_i7.Dio>(() => registerModule.dio(gh<_i5.Storage>()));
  gh.singleton<_i8.ControllerClient>(
      () => _i8.ControllerClient.create(gh<_i7.Dio>()));
  gh.singleton<_i9.PrinterClient>(
      () => _i9.PrinterClient.create(gh<_i7.Dio>()));
  gh.singleton<_i10.SysClient>(() => _i10.SysClient.create(gh<_i7.Dio>()));
  gh.factory<_i11.SplashPageStore>(() => _i11.SplashPageStore(
        gh<_i7.Dio>(),
        gh<_i5.Storage>(),
        gh<_i4.AppRouter>(),
      ));
  gh.factory<_i12.ControllerListPageStore>(() => _i12.ControllerListPageStore(
        gh<_i10.SysClient>(),
        gh<_i8.ControllerClient>(),
      ));
  gh.factory<_i13.ServerSettingPageStore>(() => _i13.ServerSettingPageStore(
        configClient: gh<_i10.SysClient>(),
        storage: gh<_i5.Storage>(),
        dio: gh<_i7.Dio>(),
        router: gh<_i4.AppRouter>(),
      ));
  gh.factory<_i14.PrinterPageStore>(() => _i14.PrinterPageStore(
        sysClient: gh<_i10.SysClient>(),
        controllerCLient: gh<_i8.ControllerClient>(),
        appRouter: gh<_i4.AppRouter>(),
        printerClient: gh<_i9.PrinterClient>(),
      ));
  gh.factory<_i15.ControllerEditPageStore>(() => _i15.ControllerEditPageStore(
        gh<_i8.ControllerClient>(),
        gh<_i4.AppRouter>(),
      ));
  gh.factory<_i16.AddChannelPageStore>(() => _i16.AddChannelPageStore(
        sysClient: gh<_i10.SysClient>(),
        controllerClient: gh<_i8.ControllerClient>(),
      ));
  gh.factory<_i17.PrinterSettingPageStore>(() => _i17.PrinterSettingPageStore(
        gh<_i10.SysClient>(),
        gh<_i9.PrinterClient>(),
        gh<_i4.AppRouter>(),
        gh<_i5.Storage>(),
      ));
  return getIt;
}

class _$RegisterModule extends _i18.RegisterModule {}
