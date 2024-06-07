// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:filamentor_app/pages/add_channel/add_channel_page.dart' as _i1;
import 'package:filamentor_app/pages/controller_edit/controller_edit_page.dart'
    as _i2;
import 'package:filamentor_app/pages/controller_list/controller_list_page.dart'
    as _i3;
import 'package:filamentor_app/pages/printer/printer_page.dart' as _i4;
import 'package:filamentor_app/pages/printer_setting/printer_setting_page.dart'
    as _i5;
import 'package:filamentor_app/pages/server_setting/server_setting_page.dart'
    as _i6;
import 'package:filamentor_app/pages/setting/setting_page.dart' as _i7;
import 'package:filamentor_app/pages/splash/splash_page.dart' as _i8;
import 'package:flutter/material.dart' as _i10;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    AddChannelRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddChannelPage(),
      );
    },
    ControllerEditRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ControllerEditPage(),
      );
    },
    ControllerListRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ControllerListPage(),
      );
    },
    PrinterRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.PrinterPage(),
      );
    },
    PrinterSettingRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.PrinterSettingPage(),
      );
    },
    ServerSettingRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<ServerSettingRouteArgs>(
          orElse: () => ServerSettingRouteArgs(
                  goback: queryParams.getInt(
                'goback',
                1,
              )));
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ServerSettingPage(
          key: args.key,
          goback: args.goback,
        ),
      );
    },
    SettingRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SettingPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SplashPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddChannelPage]
class AddChannelRoute extends _i9.PageRouteInfo<void> {
  const AddChannelRoute({List<_i9.PageRouteInfo>? children})
      : super(
          AddChannelRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddChannelRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ControllerEditPage]
class ControllerEditRoute extends _i9.PageRouteInfo<void> {
  const ControllerEditRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ControllerEditRoute.name,
          initialChildren: children,
        );

  static const String name = 'ControllerEditRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ControllerListPage]
class ControllerListRoute extends _i9.PageRouteInfo<void> {
  const ControllerListRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ControllerListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ControllerListRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.PrinterPage]
class PrinterRoute extends _i9.PageRouteInfo<void> {
  const PrinterRoute({List<_i9.PageRouteInfo>? children})
      : super(
          PrinterRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrinterRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.PrinterSettingPage]
class PrinterSettingRoute extends _i9.PageRouteInfo<void> {
  const PrinterSettingRoute({List<_i9.PageRouteInfo>? children})
      : super(
          PrinterSettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrinterSettingRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ServerSettingPage]
class ServerSettingRoute extends _i9.PageRouteInfo<ServerSettingRouteArgs> {
  ServerSettingRoute({
    _i10.Key? key,
    int goback = 1,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          ServerSettingRoute.name,
          args: ServerSettingRouteArgs(
            key: key,
            goback: goback,
          ),
          rawQueryParams: {'goback': goback},
          initialChildren: children,
        );

  static const String name = 'ServerSettingRoute';

  static const _i9.PageInfo<ServerSettingRouteArgs> page =
      _i9.PageInfo<ServerSettingRouteArgs>(name);
}

class ServerSettingRouteArgs {
  const ServerSettingRouteArgs({
    this.key,
    this.goback = 1,
  });

  final _i10.Key? key;

  final int goback;

  @override
  String toString() {
    return 'ServerSettingRouteArgs{key: $key, goback: $goback}';
  }
}

/// generated route for
/// [_i7.SettingPage]
class SettingRoute extends _i9.PageRouteInfo<void> {
  const SettingRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SplashPage]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
