import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class RespConfig {

  const RespConfig({
    required this.printerList,
    required this.detectList,
    required this.controllerList,
    required this.channelRelations,
    required this.detectRelations,
    required this.mqttConfig,
  });

  final List<RespPrinter> printerList;
  final List<RespDetector> detectList;
  final List<RespController> controllerList;
  final List<RespChannelRelation> channelRelations;
  final List<RespDetectRelation> detectRelations;
  final RespMqttConfig mqttConfig;

  factory RespConfig.fromJson(Map<String,dynamic> json) => RespConfig(
    printerList: (json['printer_list'] as List? ?? []).map((e) => RespPrinter.fromJson(e as Map<String, dynamic>)).toList(),
    detectList: (json['detect_list'] as List? ?? []).map((e) => RespDetector.fromJson(e as Map<String, dynamic>)).toList(),
    controllerList: (json['controller_list'] as List? ?? []).map((e) => RespController.fromJson(e as Map<String, dynamic>)).toList(),
    channelRelations: (json['channel_relations'] as List? ?? []).map((e) => RespChannelRelation.fromJson(e as Map<String, dynamic>)).toList(),
    detectRelations: (json['detect_relations'] as List? ?? []).map((e) => RespDetectRelation.fromJson(e as Map<String, dynamic>)).toList(),
    mqttConfig: RespMqttConfig.fromJson(json['mqtt_config'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'printer_list': printerList.map((e) => e.toJson()).toList(),
    'detect_list': detectList.map((e) => e.toJson()).toList(),
    'controller_list': controllerList.map((e) => e.toJson()).toList(),
    'channel_relations': channelRelations.map((e) => e.toJson()).toList(),
    'detect_relations': detectRelations.map((e) => e.toJson()).toList(),
    'mqtt_config': mqttConfig.toJson()
  };

  RespConfig clone() => RespConfig(
    printerList: printerList.map((e) => e.clone()).toList(),
    detectList: detectList.map((e) => e.clone()).toList(),
    controllerList: controllerList.map((e) => e.clone()).toList(),
    channelRelations: channelRelations.map((e) => e.clone()).toList(),
    detectRelations: detectRelations.map((e) => e.clone()).toList(),
    mqttConfig: mqttConfig.clone()
  );


  RespConfig copyWith({
    List<RespPrinter>? printerList,
    List<RespDetector>? detectList,
    List<RespController>? controllerList,
    List<RespChannelRelation>? channelRelations,
    List<RespDetectRelation>? detectRelations,
    RespMqttConfig? mqttConfig
  }) => RespConfig(
    printerList: printerList ?? this.printerList,
    detectList: detectList ?? this.detectList,
    controllerList: controllerList ?? this.controllerList,
    channelRelations: channelRelations ?? this.channelRelations,
    detectRelations: detectRelations ?? this.detectRelations,
    mqttConfig: mqttConfig ?? this.mqttConfig,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RespConfig && printerList == other.printerList && detectList == other.detectList && controllerList == other.controllerList && channelRelations == other.channelRelations && detectRelations == other.detectRelations && mqttConfig == other.mqttConfig;

  @override
  int get hashCode => printerList.hashCode ^ detectList.hashCode ^ controllerList.hashCode ^ channelRelations.hashCode ^ detectRelations.hashCode ^ mqttConfig.hashCode;
}
