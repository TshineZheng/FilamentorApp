import 'package:auto_route/auto_route.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:filamentor_app/app.dart';
import 'package:filamentor_app/common/base/base_page_state.dart';
import 'package:filamentor_app/config/app_router.dart';
import 'package:filamentor_app/config/app_router.gr.dart';
import 'package:filamentor_app/pages/printer/printer_page_store.gen.dart';
import 'package:filamentor_app/pages/printer/widget/channel_item.dart';
import 'package:filamentor_app/pages/printer/widget/detector_item.dart';
import 'package:filamentor_app/pages/printer/widget/list_header.dart';
import 'package:filamentor_app/pages/printer/widget/setting_item.dart';
import 'package:filamentor_app/widgets/common_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

@RoutePage()
class PrinterPage extends StatefulWidget {
  const PrinterPage({super.key});

  @override
  State<PrinterPage> createState() => _PrinterPageState();
}

class _PrinterPageState extends BasePageState<PrinterPage, PrinterPageStore> {
  final AppRouter router = gain<AppRouter>();

  final EasyRefreshController _controller = EasyRefreshController(
    controlFinishRefresh: true,
    controlFinishLoad: true,
  );

  @override
  void initState() {
    super.initState();
    store.loadConfig$retry();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget buildContent(BuildContext context) {
    return Observer(builder: (_) {
      if (store.printerIp.isEmpty) {
        return _buildNoPrinter();
      }
      return Scaffold(
        appBar: AppBar(
          title: _buildPrinterInfo(),
          actions: [
            IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () async {
                  await router.push(const SettingRoute());
                  store.refresh((msg) {});
                }),
          ],
        ),
        body: EasyRefresh(
          controller: _controller,
          onRefresh: () => store.refresh((msg) {
            _controller.finishRefresh();
          }),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: CustomScrollView(
              slivers: [
                _buildChannelHeader(),
                _buildChannelList(),
                _buildDetectHeader(),
                _buildDetectorList(),
                _buildPrintHeader(),
                _buildSettings(),
              ],
            ),
          ),
        ),
      );
    });
  }

  Scaffold _buildNoPrinter() {
    return Scaffold(

      resizeToAvoidBottomInset : false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('没有打印机，请先创建'),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () async {
                final r = await router.push(const PrinterSettingRoute());
                // ignore: unrelated_type_equality_checks
                if (r == 1) {
                  store.refresh((msg) {});
                }
              },
              child: const Text('去创建'),
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildPrintHeader() => const SliverToBoxAdapter(child: ListHeader('打印设置'));

  Widget _buildDetectHeader() {
    return Observer(builder: (_) {
      if (store.detectorList.isNotEmpty) {
        return const SliverToBoxAdapter(child: ListHeader('检测器'));
      }
      return const SizedBox.shrink();
    });
  }

  SliverToBoxAdapter _buildChannelHeader() {
    return SliverToBoxAdapter(
      child: ListHeader(
        '通道',
        trailing: Row(
          children: [
            IconButton(
              onPressed: () async {
                await router.push(const AddChannelRoute());
                store.refresh((msg) {});
              },
              icon: const Icon(Icons.add),
            ),
            Observer(builder: (_) {
              return IconButton(
                onPressed: store.channelList.isEmpty
                    ? null
                    : () async {
                        if (await confirm(
                          context,
                          content: const Text('确认移除最后一个通道?'),
                          textOK: const Text('确认'),
                          textCancel: const Text('取消'),
                          canPop: true,
                        )) {
                          final c = store.channelList.last;
                          store.unbindChannel(c.controllerId, c.channel);
                        }
                      },
                icon: const Icon(Icons.remove),
              );
            })
          ],
        ),
      ),
    );
  }

  Widget _buildSettings() {
    return CommonList(children: [
      Observer(builder: (_) {
        return NumberSettingItem(
          title: '当前通道',
          value: store.curFila + 1,
          onCommit: (p0) => store.setCurFila(p0 - 1),
          minValue: 1,
        );
      }),
      Observer(builder: (_) {
        return NumberSettingItem(
          title: '换色温度',
          value: store.filaChangeTemp,
          onCommit: (p0) => store.setFilaChangeTemp(p0),
          minValue: 0,
        );
      }),
    ]);
  }

  Widget _buildPrinterInfo() {
    return Observer(builder: (_) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(store.alias),
          Text(store.printerIp, style: const TextStyle(fontSize: 12.0)),
        ],
      );
    });
  }

  Widget _buildDetectorList() {
    return Observer(
      builder: (_) => CommonList(
        children: List.generate(
          store.detectorList.length,
          (index) => DetectorItem(detector: store.detectorList[index]),
        ),
      ),
    );
  }

  Widget _buildChannelList() {
    return Observer(
      builder: (_) {
        if (store.channelList.isEmpty) {
          return const SliverToBoxAdapter(child: Center(child: Text('暂无通道')));
        }

        return CommonList(
          children: List.generate(
            store.channelList.length,
            (index) => ChannelItem(
              printerChannel: index + 1,
              channel: store.channelList[index],
              onAction: (controllerId, channel, action) => store.control$retry(controllerId, channel, action),
              onEdit: (type, color) {
                store.editChannelFilamente(
                    channel: store.channelList[index], filaType: type, color: color, printerChannel: index);
              },
            ),
          ),
        );
      },
    );
  }
}
