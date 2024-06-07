import 'package:auto_route/auto_route.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:filamentor_app/common/base/base_page_state.dart';
import 'package:filamentor_app/pages/controller_list/controller_list_page_store.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';

@RoutePage()
class ControllerListPage extends StatefulWidget {
  const ControllerListPage({super.key});

  @override
  State<ControllerListPage> createState() => _ControllerListPageState();
}

class _ControllerListPageState extends BasePageState<ControllerListPage, ControllerListPageStore> {
  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('供料控制器'),
      ),
      body: Observer(builder: (_) {
        if (store.controllerList.isEmpty) {
          return const Center(child: Text('没有可用控制器'));
        }
        return SettingsList(sections: [
          SettingsSection(
            tiles: List.generate(
              store.controllerList.length,
              (index) => SettingsTile.navigation(
                title: Text(store.controllerList[index].alias),
                value: Text(store.controllerList[index].des),
                onPressed: (context) async {
                  if (await confirm(
                    context,
                    content:  Text('删除控制器 ${store.controllerList[index].alias}?'),
                    textOK: const Text('确认'),
                    textCancel: const Text('取消'),
                    canPop: true,
                  )) {
                    store.delete(store.controllerList[index].id);
                  }
                },
              ),
            ),
          ),
        ]);
      }),
    );
  }
}
