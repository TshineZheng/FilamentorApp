import 'package:auto_route/auto_route.dart';
import 'package:filamentor_app/common/base/base_page_state.dart';
import 'package:filamentor_app/pages/server_setting/server_setting_page_store.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

@RoutePage()
class ServerSettingPage extends StatefulWidget {
  const ServerSettingPage({super.key, @QueryParam('goback') int goback = 1});

  @override
  State<ServerSettingPage> createState() => _ServerSettingPageState();
}

class _ServerSettingPageState extends BasePageState<ServerSettingPage, ServerSettingPageStore> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    store.goback = context.routeData.queryParams.getInt('goback', 1) == 1 ? true : false;
    // store.goback = context.routeData.queryParams.getBool('goback',true);
    super.initState();
  }

  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filamentor 服务器')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              Observer(builder: (_) {
                return FormBuilderTextField(
                  name: 'server_url',
                  initialValue: store.serverUrl,
                  decoration: InputDecoration(
                    labelText: '服务器地址',
                    prefix: store.useSSL ? const Text('https://') : const Text('http://'),
                  ),
                  validator: (value) => value == null || value.isEmpty ? '服务器地址不能为空' : null,
                );
              }),
              const SizedBox(height: 10),
              Observer(builder: (_) {
                return FormBuilderTextField(
                  name: 'port',
                  initialValue: store.serverPort.toString(),
                  decoration: const InputDecoration(labelText: '端口'),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) => value == null || value.isEmpty ? '端口不能为空' : null,
                );
              }),
              const SizedBox(height: 10),
              Observer(builder: (_) {
                return FormBuilderCheckbox(
                  name: 'use_ssl',
                  initialValue: store.useSSL,
                  title: const Text('SSL 加密连接'),
                  onChanged: (value) => store.useSSL = value!,
                );
              }),
              const SizedBox(height: 40),
              OutlinedButton(
                onPressed: () {
                  // Validate and save the form values
                  if (_formKey.currentState?.saveAndValidate() ?? false) {
                    store.submit$$catch(
                      '${store.useSSL ? 'https' : 'http'}://${_formKey.currentState?.value['server_url']}',
                      int.parse(_formKey.currentState?.value['port']),
                    );
                  }
                },
                child: const Text('提交'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
