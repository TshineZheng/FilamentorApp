import 'package:auto_route/auto_route.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:filamentor_app/common/base/base_page_state.dart';
import 'package:filamentor_app/pages/printer_setting/printer_setting_page_store.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

@RoutePage()
class PrinterSettingPage extends StatefulWidget {
  const PrinterSettingPage({super.key});

  @override
  State<PrinterSettingPage> createState() => _PrinterSettingPageState();
}

class _PrinterSettingPageState extends BasePageState<PrinterSettingPage, PrinterSettingPageStore> {
  final _formKey = GlobalKey<FormBuilderState>();
  List<ReactionDisposer>? _disposers;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _disposers ??= [
      reaction((_) => store.ip, update),
    ];
  }

  @override
  void dispose() {
    super.dispose();
    _disposers?.forEach((element) => element());
  }

  void update(String ip) {
    if (mounted) {
      _formKey.currentState!.patchValue({
        'ip': store.ip,
        'lanPWD': store.lanPWD,
        'deviceSerial': store.deviceSerial,
        'alias': store.alias,
      });
    }
  }

  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('打印机')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderDropdown<String>(
                name: 'type',
                decoration: const InputDecoration(
                  labelText: '类型',
                ),
                initialValue: 'bambu_client',
                enabled: false,
                items: const [
                  DropdownMenuItem(
                    value: 'bambu_client',
                    child: Text('拓竹'),
                  )
                ],
              ),
              Observer(builder: (_) {
                return FormBuilderTextField(
                  enabled: store.ip.isEmpty,
                  name: 'alias',
                  initialValue: store.alias,
                  decoration: const InputDecoration(
                    labelText: '名称',
                  ),
                  validator: (value) => value == null || value.isEmpty ? '别名不能为空' : null,
                );
              }),
              Observer(builder: (_) {
                return FormBuilderTextField(
                  enabled: store.ip.isEmpty,
                  name: 'ip',
                  initialValue: store.ip,
                  decoration: const InputDecoration(
                    labelText: 'IP地址',
                  ),
                  validator: (value) => value == null || value.isEmpty ? 'IP地址不能为空' : null,
                );
              }),
              const SizedBox(height: 10),
              Observer(builder: (_) {
                return FormBuilderTextField(
                  enabled: store.ip.isEmpty,
                  name: 'lanPWD',
                  initialValue: store.lanPWD,
                  decoration: const InputDecoration(
                    labelText: 'Lan密码',
                  ),
                  validator: (value) => value == null || value.isEmpty ? 'Lan密码不能为空' : null,
                );
              }),
              const SizedBox(height: 10),
              Observer(builder: (_) {
                return FormBuilderTextField(
                  enabled: store.ip.isEmpty,
                  name: 'deviceSerial',
                  initialValue: store.deviceSerial,
                  decoration: const InputDecoration(
                    labelText: '设备序列号',
                  ),
                  validator: (value) => value == null || value.isEmpty ? '设备序列号不能为空' : null,
                );
              }),
              const SizedBox(height: 40),
              Observer(builder: (_) {
                if (store.ip.isNotEmpty) {
                  return OutlinedButton(
                    onPressed: () async {
                      if (await confirm(
                        context,
                        content: const Text('确认删除?'),
                        textOK: const Text('确认'),
                        textCancel: const Text('取消'),
                        canPop: true,
                      )) {
                        store.delete();
                      }
                    },
                    child: const Text('删除'),
                  );
                }
                return OutlinedButton(
                  onPressed: () {
                    if (_formKey.currentState?.saveAndValidate() ?? false) {
                      store.create(
                        _formKey.currentState?.value['ip'],
                        _formKey.currentState?.value['lanPWD'],
                        _formKey.currentState?.value['deviceSerial'],
                        _formKey.currentState?.value['alias'],
                      );
                    }
                  },
                  child: const Text('提交'),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
