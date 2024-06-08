import 'package:auto_route/auto_route.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:filamentor_app/app.dart';
import 'package:filamentor_app/common/base/base_page_state.dart';
import 'package:filamentor_app/config/app_router.dart';
import 'package:filamentor_app/config/app_router.gr.dart';
import 'package:filamentor_app/pages/add_channel/add_channel_page_store.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tuple/tuple.dart';

@RoutePage()
class AddChannelPage extends StatefulWidget {
  const AddChannelPage({super.key});

  @override
  State<AddChannelPage> createState() => _AddChannelPageState();
}

class _AddChannelPageState extends BasePageState<AddChannelPage, AddChannelPageStore> {
  final appRouter = gain<AppRouter>();

  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('增加通道')),
      body: Observer(builder: (_) {
        if (!store.dateLoaded) {
          return const SizedBox.shrink();
        }

        if (store.controllers.isEmpty) {
          return _buildEmptyView();
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('控制器:', style: Theme.of(context).textTheme.titleLarge),
                  Row(
                    children: [
                      IconButton(
                          onPressed: ()async {
                            await appRouter.push(const ControllerEditRoute());
                            store.loadData();
                          },
                          icon: const Row(
                            children: [
                              Text('新增'),
                              Icon(Icons.add),
                            ],
                          )),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10),
              _buildControllerSelector(),
              const SizedBox(height: 10),
              Observer(builder: (_) {
                return Text('通道数量：${store.curController?.channels.length ?? 0}  未绑定: ${store.unusedChannel.length}');
              }),
              const SizedBox(height: 10),
              Text('可绑定通道:', style: Theme.of(context).textTheme.titleLarge),
              _buildUnBindChannelList(),
              _buildCommit(context),
            ],
          ),
        );
      }),
    );
  }

  Center _buildEmptyView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('没有可用的供料控制器'),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: () async {
              await appRouter.push(const ControllerEditRoute());
              store.loadData();
            },
            child: const Text('去创建'),
          )
        ],
      ),
    );
  }

  Center _buildCommit(BuildContext context) {
    return Center(
      child: Observer(builder: (_) {
        if (store.unusedChannel.isEmpty) {
          return const SizedBox.shrink();
        }

        return OutlinedButton(
          onPressed: !store.isSelected
              ? null
              : () async {
                  StringBuffer sb = StringBuffer();

                  for (var element in store.channelSelected) {
                    if (element.item2) {
                      if (sb.isNotEmpty) sb.write(', ');

                      sb.write('#${element.item1}');
                    }
                  }

                  if (await confirm(
                    context,
                    content: Text('确认绑定 ${store.curController?.alias} 的 ${sb.toString()}?'),
                    textOK: const Text('确认'),
                    textCancel: const Text('取消'),
                    canPop: true,
                  )) {
                    store.bind();
                  }
                },
          child: const Text('绑定'),
        );
      }),
    );
  }

  Observer _buildUnBindChannelList() {
    return Observer(builder: (_) {
      if (store.unusedChannel.isEmpty) {
        return const Center(child: Text('没有可用通道'));
      }
      return Expanded(
        child: ListView.builder(
          shrinkWrap: false,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('# ${store.unusedChannel[index].channel.toString()}'),
              trailing: Observer(builder: (_) {
                return Checkbox(
                  onChanged: (value) {
                    if (value != null) store.channelSelected[index] = Tuple2(store.channelSelected[index].item1, value);
                  },
                  value: store.channelSelected[index].item2,
                );
              }),
            );
          },
          itemCount: store.unusedChannel.length,
        ),
      );
    });
  }

  DropdownButtonFormField<String> _buildControllerSelector() {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        filled: true,
        // fillColor: Colors.blueAccent,
      ),
      items: store.controllers.map((e) {
        return DropdownMenuItem(
          value: e.id,
          child: Text(e.alias),
        );
      }).toList(),
      value: store.curController?.id,
      onChanged: (value) {
        if (value != null) {
          for (var element in store.controllers) {
            if (element.id == value) {
              store.curController = element;
              break;
            }
          }
        }
      },
    );
  }
}
