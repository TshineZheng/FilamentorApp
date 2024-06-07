import 'package:auto_route/auto_route.dart';
import 'package:filamentor_app/common/base/base_page_state.dart';
import 'package:filamentor_app/helper/assets.gen.dart';
import 'package:filamentor_app/pages/splash/splash_page_store.gen.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends BasePageState<SplashPage, SplashPageStore> with WindowListener {
  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  void onWindowFocus() {
    setState(() {});
  }

  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Assets.image.splashCenter.image(
              width: 127,
              fit: BoxFit.contain,
            ),
          ),
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   right: 0,
          //   child: Assets.image.splashBottom.image(
          //     fit: BoxFit.contain,
          //   ),
          // )
        ],
      ),
    );
  }
}
