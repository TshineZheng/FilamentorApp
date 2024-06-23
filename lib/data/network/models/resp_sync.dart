import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class RespSync {

  const RespSync({
    required this.ams,
    required this.controller,
    required this.detect,
  });

  final List<RespSyncAms> ams;
  final List<RespSyncController> controller;
  final List<RespSyncDetect> detect;

  factory RespSync.fromJson(Map<String,dynamic> json) => RespSync(
    ams: (json['ams'] as List? ?? []).map((e) => RespSyncAms.fromJson(e as Map<String, dynamic>)).toList(),
    controller: (json['controller'] as List? ?? []).map((e) => RespSyncController.fromJson(e as Map<String, dynamic>)).toList(),
    detect: (json['detect'] as List? ?? []).map((e) => RespSyncDetect.fromJson(e as Map<String, dynamic>)).toList()
  );
  
  Map<String, dynamic> toJson() => {
    'ams': ams.map((e) => e.toJson()).toList(),
    'controller': controller.map((e) => e.toJson()).toList(),
    'detect': detect.map((e) => e.toJson()).toList()
  };

  RespSync clone() => RespSync(
    ams: ams.map((e) => e.clone()).toList(),
    controller: controller.map((e) => e.clone()).toList(),
    detect: detect.map((e) => e.clone()).toList()
  );


  RespSync copyWith({
    List<RespSyncAms>? ams,
    List<RespSyncController>? controller,
    List<RespSyncDetect>? detect
  }) => RespSync(
    ams: ams ?? this.ams,
    controller: controller ?? this.controller,
    detect: detect ?? this.detect,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RespSync && ams == other.ams && controller == other.controller && detect == other.detect;

  @override
  int get hashCode => ams.hashCode ^ controller.hashCode ^ detect.hashCode;
}
