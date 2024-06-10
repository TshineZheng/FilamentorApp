import 'package:filamentor_app/models/channel.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

const List<Color> colors = [
  Colors.white,
  Colors.black,
  Colors.red,
  Colors.pink,
  Colors.purple,
  Colors.deepPurple,
  Colors.indigo,
  Colors.blue,
  Colors.lightBlue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.lightGreen,
  Colors.lime,
  Colors.yellow,
  Colors.amber,
  Colors.orange,
  Colors.deepOrange,
  Colors.brown,
  Colors.grey,
  Colors.blueGrey,
];

const int _portraitCrossAxisCount = 4;
const int _landscapeCrossAxisCount = 5;
const double _borderRadius = 30;
const double _blurRadius = 5;
const double _iconSize = 24;

final customBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(24),
  borderSide: const BorderSide(style: BorderStyle.none),
);

Widget pickerLayoutBuilder(BuildContext context, List<Color> colors, PickerItem child) {
  Orientation orientation = MediaQuery.of(context).orientation;

  return SizedBox(
    width: 300,
    height: orientation == Orientation.portrait ? 240 : 240,
    child: GridView.count(
      crossAxisCount: orientation == Orientation.portrait ? _portraitCrossAxisCount : _landscapeCrossAxisCount,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      children: [for (Color color in colors) child(color)],
    ),
  );
}

Widget pickerItemBuilder(BuildContext context, color, bool isCurrentColor, void Function() changeColor) {
  final cl = color.computeLuminance();

  return Container(
    margin: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(_borderRadius),
      color: color,
      boxShadow: [
        BoxShadow(
          color: cl < 0.8 ? color.withOpacity(0.8) : Colors.grey.withOpacity(0.8),
          offset: const Offset(1, 2),
          blurRadius: _blurRadius,
        )
      ],
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: changeColor,
        borderRadius: BorderRadius.circular(_borderRadius),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 250),
          opacity: isCurrentColor ? 1 : 0,
          child: Icon(
            Icons.done,
            size: _iconSize,
            color: useWhiteForeground(color) ? Colors.white : Colors.black,
          ),
        ),
      ),
    ),
  );
}

class ChannelItem extends StatelessWidget {
  final int printerChannel;
  final Channel channel;
  final void Function(String controllerId, int channel, int action) onAction;
  final void Function(String type, Color color)? onEdit;
  const ChannelItem({
    super.key,
    required this.printerChannel,
    required this.channel,
    required this.onAction,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [
          Hero(
            tag: 'channel$printerChannel',
            child: GestureDetector(
              child: ChannelIcon(channel: channel, printerChannel: printerChannel,),
              onTap: () => _filamentEditor(context),
            ),
          ),
          // const SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(color: HexColor('#dbe4ee'), borderRadius: BorderRadius.circular(15)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Observer(builder: (_) {
                    return Text(channel.filamentType);
                  }),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        channel.controllerName,
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      Text('#${channel.channel}'),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      onTap: () => _channelControll(context),
    );
  }

  Future<dynamic> _channelControll(BuildContext context) {
    return showMaterialModalBottomSheet(
      context: context,
      builder: (context) {
        final ret = Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 40),
                Hero(
                  tag: 'channel$printerChannel',
                  child: ChannelIcon(channel: channel, printerChannel: printerChannel,),
                ),
                const SizedBox(height: 20),
                Observer(builder: (_) {
                  return Text(channel.filamentType);
                }),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                        onPressed: () => onAction(channel.controllerId, channel.channel, 2), child: const Text('退料')),
                    const SizedBox(width: 20),
                    OutlinedButton(
                        onPressed: () => onAction(channel.controllerId, channel.channel, 0), child: const Text('停止')),
                    const SizedBox(width: 20),
                    OutlinedButton(
                        onPressed: () => onAction(channel.controllerId, channel.channel, 1), child: const Text('进料')),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.grey),
                onPressed: () => Navigator.of(context).pop(),
              ),
            )
          ],
        );
        return ret;
      },
    );
  }

  Future<dynamic> _filamentEditor(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            final TextEditingController textEditingController = TextEditingController();

            Color curColor = channel.filamentColor;
            textEditingController.text = channel.filamentType;

            final colorList = List<Color>.from(colors);
            bool hasColor = false;

            for (var element in colorList) {
              if (element.toHexString() == curColor.toHexString()) {
                hasColor = true;
                break;
              }
            }

            if (!hasColor) {
              colorList.insert(0, curColor);
            }

            return AlertDialog(
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    const Center(
                      child: Text('耗材类型', style: TextStyle(fontSize: 16)),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      autofocus: false,
                      controller: textEditingController,
                      decoration: InputDecoration(
                        border: customBorder,
                        enabledBorder: customBorder,
                        focusedBorder: customBorder,
                        focusedErrorBorder: customBorder,
                        errorBorder: customBorder,
                        hintText: "耗材类型",
                        filled: true,
                        fillColor: const Color(0xffF6F6F8),
                        //隐藏下划线
                        //border: InputBorder.none,
                        hintStyle: const TextStyle(fontSize: 15, color: Color(0xffAEAEAE)),
                        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      ),
                      // 校验用户名,校验成功返回null，失败则返回错误信息
                      validator: (value) {
                        return value!.trim().isNotEmpty ? null : "耗材类型不能为空";
                      },
                    ),
                    const SizedBox(height: 10),
                    const Center(
                      child: Text('耗材颜色', style: TextStyle(fontSize: 16)),
                    ),
                    const SizedBox(height: 10),
                    BlockPicker(
                      pickerColor: curColor,
                      onColorChanged: (c) {
                        curColor = c;
                      },
                      availableColors: colorList,
                      layoutBuilder: pickerLayoutBuilder,
                      itemBuilder: (color, b, f) {
                        return pickerItemBuilder(context, color, b, f);
                      },
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      width: 150,
                      child: OutlinedButton(
                          onPressed: () {
                            if (onEdit != null) onEdit!(textEditingController.text, curColor);
                            Navigator.of(context).pop();
                          },
                          child: const Text('确定')),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

final state2icon = {
  0: Icons.stop,
  1: Icons.keyboard_arrow_right,
  2: Icons.keyboard_arrow_left,
};

class ChannelIcon extends StatelessWidget {
  final Channel channel;
  final int printerChannel;
  const ChannelIcon({
    super.key,
    required this.channel,
    required this.printerChannel,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: channel.filamentColor.computeLuminance() < 0.8
                      ? channel.filamentColor.withOpacity(0.8)
                      : Colors.grey.withOpacity(0.8),
                  offset: const Offset(1, 2),
                  blurRadius: 24,
                )
              ],
            ),
            child: Observer(
              builder: (_) {
                return CircleAvatar(
                  backgroundColor: channel.filamentColor,
                  child: Text(
                    '$printerChannel',
                    style:
                        TextStyle(color: channel.filamentColor.computeLuminance() > 0.5 ? Colors.black : Colors.white),
                  ),
                );
              },
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Observer(builder: (_) {
            return Opacity(
              opacity: channel.state == 0 ? 0 : 1,
              child: Container(
                decoration: BoxDecoration(shape: BoxShape.circle, color: HexColor('#dbe4ee')),
                child: Icon(
                  state2icon[channel.state] ?? Icons.pause_circle,
                  color: Colors.green,
                  size: 18,
                ),
              ),
            );
          }),
        )
      ],
    );
  }
}
