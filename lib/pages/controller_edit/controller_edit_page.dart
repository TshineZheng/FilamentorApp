import 'package:auto_route/auto_route.dart';
import 'package:filamentor_app/common/base/base_page_state.dart';
import 'package:filamentor_app/pages/controller_edit/controller_edit_page_store.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class ControllerEditPage extends StatefulWidget {
  const ControllerEditPage({super.key});

  @override
  State<ControllerEditPage> createState() => _ControllerEditPageState();
}

class _ControllerEditPageState extends BasePageState<ControllerEditPage, ControllerEditPageStore> {
  final _formKey = GlobalKey<FormBuilderState>();
  String curType = 'yba_ams_py';

  late Map<String, Function(BuildContext context)> type2form;

  _ControllerEditPageState() {
    type2form = {
      'yba_ams_py': _buildYBAAMSPYForm,
      'yba_ams': _buildYBAAMSForm,
      'yba_ams_servo': _buildYBAAMSPYSERVOForm,
    };
  }

  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('新增控制器'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildType(),
              const SizedBox(height: 10),
              type2form[curType]!(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildYBAAMSForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Linkify(
          onOpen: (link) async {
            if (!await launchUrl(Uri.parse(link.url))) {
              store.showMessage('Could not launch ${link.url}');
            }
          },
          text: "作者: 不死鳥の守り (B站UP主)\n项目地址: https://github.com/YBA0312/YBA-AMS-ESP",
        ),
        const SizedBox(height: 10),
        _buildYBALikeForm('yba_ams'),
      ],
    );
  }

  Widget _buildYBAAMSPYForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Linkify(
          onOpen: (link) async {
            if (!await launchUrl(Uri.parse(link.url))) {
              store.showMessage('Could not launch ${link.url}');
            }
          },
          text: "作者: Tshine\n项目地址: https://github.com/TshineZheng/YBA-AMS-ESP-PY",
        ),
        const SizedBox(height: 10),
        _buildYBALikeForm('yba_ams_py'),
      ],
    );
  }

  Widget _buildYBAAMSPYSERVOForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Linkify(
          onOpen: (link) async {
            if (!await launchUrl(Uri.parse(link.url))) {
              store.showMessage('Could not launch ${link.url}');
            }
          },
          text: "作者: Tshine\n项目地址: https://github.com/TshineZheng/YBA-AMS-ESP-PY",
        ),
        const SizedBox(height: 10),
        _buildYBALikeForm('yba_ams_servo'),
      ],
    );
  }

  Widget _buildYBALikeForm(String type) {
    return Column(
      children: [
        FormBuilderTextField(
          name: 'alias',
          decoration: const InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: '名称',
            hintText: '输入控制器名称',
          ),
          validator: (value) => value == null || value.isEmpty ? '名称不能为空' : null,
        ),
        FormBuilderTextField(
          name: 'ip',
          decoration: const InputDecoration(
            labelText: 'IP地址',
            hintText: '输入控制器的ip地址',
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          validator: (value) => value == null || value.isEmpty ? 'IP地址不能为空' : null,
        ),
        FormBuilderTextField(
          name: 'total_channel',
          initialValue: 4.toString(),
          decoration: const InputDecoration(labelText: '通道数量'),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          validator: (value) => value == null || value.isEmpty ? '通道数量不能为空' : null,
        ),
        const SizedBox(height: 40),
        OutlinedButton(
          onPressed: () {
            if (_formKey.currentState?.saveAndValidate() ?? false) {
              store.create$catch(
                type,
                _formKey.currentState?.value['alias'],
                _formKey.currentState?.value['ip'],
                int.parse(_formKey.currentState?.value['total_channel']),
              );
            }
          },
          child: const Text('创建'),
        )
      ],
    );
  }

  FormBuilderDropdown<String> _buildType() {
    return FormBuilderDropdown<String>(
      name: 'type',
      decoration: const InputDecoration(
        labelText: '类型',
      ),
      initialValue: curType,
      onChanged: (value) {
        setState(() {
          curType = value!;
        });
      },
      items: const [
        DropdownMenuItem(
          value: 'yba_ams_py',
          child: Text('YBA-AMS-PY'),
        ),
        DropdownMenuItem(
          value: 'yba_ams',
          child: Text('YBA-AMS'),
        ),
        DropdownMenuItem(
          value: 'yba_ams_servo',
          child: Text('YBA-AMS-PY 被动送料版'),
        )
      ],
    );
  }
}
