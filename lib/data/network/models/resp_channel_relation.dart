import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class RespChannelRelation {

  const RespChannelRelation({
    required this.printerId,
    required this.controllerId,
    required this.channel,
    this.filamentType,
    this.filamentColor,
  });

  final String printerId;
  final String controllerId;
  final int channel;
  final String? filamentType;
  final String? filamentColor;

  factory RespChannelRelation.fromJson(Map<String,dynamic> json) => RespChannelRelation(
    printerId: json['printer_id'].toString(),
    controllerId: json['controller_id'].toString(),
    channel: json['channel'] as int,
    filamentType: json['filament_type']?.toString(),
    filamentColor: json['filament_color']?.toString()
  );
  
  Map<String, dynamic> toJson() => {
    'printer_id': printerId,
    'controller_id': controllerId,
    'channel': channel,
    'filament_type': filamentType,
    'filament_color': filamentColor
  };

  RespChannelRelation clone() => RespChannelRelation(
    printerId: printerId,
    controllerId: controllerId,
    channel: channel,
    filamentType: filamentType,
    filamentColor: filamentColor
  );


  RespChannelRelation copyWith({
    String? printerId,
    String? controllerId,
    int? channel,
    Optional<String?>? filamentType,
    Optional<String?>? filamentColor
  }) => RespChannelRelation(
    printerId: printerId ?? this.printerId,
    controllerId: controllerId ?? this.controllerId,
    channel: channel ?? this.channel,
    filamentType: checkOptional(filamentType, () => this.filamentType),
    filamentColor: checkOptional(filamentColor, () => this.filamentColor),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RespChannelRelation && printerId == other.printerId && controllerId == other.controllerId && channel == other.channel && filamentType == other.filamentType && filamentColor == other.filamentColor;

  @override
  int get hashCode => printerId.hashCode ^ controllerId.hashCode ^ channel.hashCode ^ filamentType.hashCode ^ filamentColor.hashCode;
}
