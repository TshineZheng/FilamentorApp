import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class RespDetector {

  const RespDetector({
    required this.id,
    required this.type,
    required this.info,
  });

  final String id;
  final String type;
  final RespDetectorInfo info;

  factory RespDetector.fromJson(Map<String,dynamic> json) => RespDetector(
    id: json['id'].toString(),
    type: json['type'].toString(),
    info: RespDetectorInfo.fromJson(json['info'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'info': info.toJson()
  };

  RespDetector clone() => RespDetector(
    id: id,
    type: type,
    info: info.clone()
  );


  RespDetector copyWith({
    String? id,
    String? type,
    RespDetectorInfo? info
  }) => RespDetector(
    id: id ?? this.id,
    type: type ?? this.type,
    info: info ?? this.info,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RespDetector && id == other.id && type == other.type && info == other.info;

  @override
  int get hashCode => id.hashCode ^ type.hashCode ^ info.hashCode;
}
