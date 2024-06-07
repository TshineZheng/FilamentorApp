import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class RespController {

  const RespController({
    required this.id,
    required this.type,
    required this.info,
    required this.alias,
  });

  final String id;
  final String type;
  final RespControllerInfo info;
  final String alias;

  factory RespController.fromJson(Map<String,dynamic> json) => RespController(
    id: json['id'].toString(),
    type: json['type'].toString(),
    info: RespControllerInfo.fromJson(json['info'] as Map<String, dynamic>),
    alias: json['alias'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'info': info.toJson(),
    'alias': alias
  };

  RespController clone() => RespController(
    id: id,
    type: type,
    info: info.clone(),
    alias: alias
  );


  RespController copyWith({
    String? id,
    String? type,
    RespControllerInfo? info,
    String? alias
  }) => RespController(
    id: id ?? this.id,
    type: type ?? this.type,
    info: info ?? this.info,
    alias: alias ?? this.alias,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RespController && id == other.id && type == other.type && info == other.info && alias == other.alias;

  @override
  int get hashCode => id.hashCode ^ type.hashCode ^ info.hashCode ^ alias.hashCode;
}
