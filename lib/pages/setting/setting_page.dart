import 'package:auto_route/annotations.dart';
import 'package:filamentor_app/app.dart';
import 'package:filamentor_app/common/base/base_page_state.dart';
import 'package:filamentor_app/config/app_router.dart';
import 'package:filamentor_app/config/app_router.gr.dart';
import 'package:filamentor_app/pages/setting/setting_page_store.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';

@RoutePage()
class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends BasePageState<SettingPage, SettingPageStore> {
  final AppRouter router = gain<AppRouter>();

  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('设置')),
      body: SettingsList(
        sections: [
          // const CustomSettingsSection(
          //   child: Padding(
          //     padding: EdgeInsets.only(left: 16, top: 16),
          //     child: Text(
          //       '打印中请不要修改设置!',
          //       style: TextStyle(color: Colors.red, fontSize: 16),
          //     ),
          //   ),
          // ),
          SettingsSection(
            // title: const Text('基本'),
            tiles: [
              SettingsTile.navigation(
                title: const Text('服务器'),
                value: Observer(builder: (_) {
                  return Text(store.serverUrl);
                }),
                onPressed: (context) => router.push(ServerSettingRoute()),
              ),
              SettingsTile.navigation(
                title: const Text('打印机'),
                value: const Text('192.168.10.65'),
                onPressed: (context) => router.push(const PrinterSettingRoute()),
              ),
              SettingsTile.navigation(
                title: const Text('供料控制器'),
                // value: const Text('192.168.10.65'),
                onPressed: (context) => router.push(const ControllerListRoute()),
              ),
              SettingsTile.navigation(
                title: const Text('检测器'),
                // value: const Text('192.168.10.65'),
                onPressed: (context) {},
              ),
            ],
          ),
          SettingsSection(
            title: const Text('换料'),
            tiles: [
              SettingsTile(
                title: const Text('送料超时'),
                trailing: const Text('30 s'),
                onPressed: (context) {},
                enabled: false,
              ),
              SettingsTile(
                title: const Text('退料超时'),
                trailing: const Text('30 s'),
                onPressed: (context) {},
                enabled: false,
              ),
              SettingsTile.switchTile(
                title: const Text('等待打印机退料后再回抽'),
                initialValue: true,
                onToggle: (bool value) {},
                enabled: false,
              ),
            ],
          ),
          SettingsSection(
            title: const Text('其他'),
            tiles: [
              SettingsTile(
                title: const Text('同步间隔'),
                trailing: const Text('1 s'),
                description: const Text('同步服务器数据的间隔时间'),
                onPressed: (context) {},
                enabled: false,
              ),
              SettingsTile.navigation(
                title: const Text('通知'),
                onPressed: (context) {},
                description: const Text('状态通知'),
                enabled: false,
              ),
              SettingsTile.navigation(
                title: const Text('关于'),
                onPressed: (context) {},
                enabled: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
