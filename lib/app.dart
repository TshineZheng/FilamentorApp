import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:filamentor_app/config/app_dimens.dart';
import 'package:filamentor_app/config/app_router.dart';
import 'package:filamentor_app/config/constants.dart';
import 'package:filamentor_app/helper/locator.gen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_intro/flutter_intro.dart';
import 'package:get_it/get_it.dart';
import 'package:json_theme/json_theme.dart';
import 'package:oktoast/oktoast.dart';
import 'package:window_manager/window_manager.dart';

GetIt gain = GetIt.instance;

Future<void> createApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  WidgetsFlutterBinding.ensureInitialized();
  if (Constants.isDesktop) {
    // 在电脑上的窗口调整成适合调试的比例
    await windowManager.ensureInitialized();
    final windowOptions = WindowOptions(
      size: AppDimens.DESIGN_SIZE + const Offset(16, 16), // win11 有16偏差
      // minimumSize: AppDimens.DESIGN_SIZE + const Offset(16, 16),
      center: false,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.normal,
      alwaysOnTop: true,
    );
    await windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  final themeStr = await rootBundle.loadString('assets/appainter_theme.json');
  final themeJson = jsonDecode(themeStr);
  final theme = ThemeDecoder.decodeThemeData(themeJson)!;

  await configureDependencies();

  if (kIsWeb) {
    gain<Dio>().options.baseUrl = Constants.baseUrl(server: 'http://${Uri.base.host}', port: 7170);
  }

  runApp(AppWidget(theme: theme));
}

class AppWidget extends StatelessWidget {
  final ThemeData theme;
  const AppWidget({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: Intro(
        padding: const EdgeInsets.all(8),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        maskColor: const Color.fromRGBO(0, 0, 0, .6),
        noAnimation: false,
        maskClosable: false,
        buttonTextBuilder: (order) {
          return '知道了';
        },
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerDelegate: gain<AppRouter>().delegate(),
          routeInformationParser: gain<AppRouter>().defaultRouteParser(),
          theme: theme,
        ),
      ),
    );
  }
}
