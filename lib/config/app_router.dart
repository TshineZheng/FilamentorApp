import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import 'app_router.gr.dart';

@singleton
@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(path: '/server_setting', page: ServerSettingRoute.page),
        AutoRoute(path: '/printer', page: PrinterRoute.page),
        AutoRoute(path: '/setting', page: SettingRoute.page),
        AutoRoute(path: '/printer_setting', page: PrinterSettingRoute.page),
        AutoRoute(path: '/controller_list', page: ControllerListRoute.page),
        AutoRoute(path: '/add_channel', page: AddChannelRoute.page),
        AutoRoute(path: '/controller_edit', page: ControllerEditRoute.page),
      ];
}
