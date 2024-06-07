import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class RespDetectorInfo {

  const RespDetectorInfo({
    required this.mqttConfig,
  });

  final RespMqttConfig mqttConfig;

  factory RespDetectorInfo.fromJson(Map<String,dynamic> json) => RespDetectorInfo(
    mqttConfig: RespMqttConfig.fromJson(json['mqtt_config'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'mqtt_config': mqttConfig.toJson()
  };

  RespDetectorInfo clone() => RespDetectorInfo(
    mqttConfig: mqttConfig.clone()
  );


  RespDetectorInfo copyWith({
    RespMqttConfig? mqttConfig
  }) => RespDetectorInfo(
    mqttConfig: mqttConfig ?? this.mqttConfig,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RespDetectorInfo && mqttConfig == other.mqttConfig;

  @override
  int get hashCode => mqttConfig.hashCode;
}
