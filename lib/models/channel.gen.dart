import 'dart:ui';

import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mobx/mobx.dart';

part 'channel.gen.g.dart';

class Channel = ChannelBase with _$Channel;

abstract class ChannelBase with Store {
  final String controllerId;
  final int channel;
  final String bindPrinter;
  final String controllerName;
  @observable
  String? _filamentType;
  @observable
  String? _filamentColor;

  @observable
  int state = 0;

  @computed
  Color get filamentColor => HexColor(_filamentColor ?? '#ffffff');

  set filamentColor(Color color) => _filamentColor = color.toHexString(includeHashSign: true, enableAlpha: false);

  set filamentType(String? type) => _filamentType = type;

  @computed
  String get filamentType => _filamentType ?? 'General';

  ChannelBase({
    required this.controllerId,
    required this.channel,
    required this.bindPrinter,
    required this.controllerName,
    String? filamentType,
    String? filamentColor,
  })  : _filamentType = filamentType,
        _filamentColor = filamentColor;
}
