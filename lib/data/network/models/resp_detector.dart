import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class RespDetector {

  const RespDetector({
    required this.id,
    required this.type,
    required this.alias,
    required this.info,
  });

  final String id;
  final String type;
  final String alias;
  final Map<String, dynamic> info;

  factory RespDetector.fromJson(Map<String,dynamic> json) => RespDetector(
    id: json['id'].toString(),
    type: json['type'].toString(),
    alias: json['alias'].toString(),
    info: json['info'] as Map<String, dynamic>
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'alias': alias,
    'info': info
  };

  RespDetector clone() => RespDetector(
    id: id,
    type: type,
    alias: alias,
    info: info
  );


  RespDetector copyWith({
    String? id,
    String? type,
    String? alias,
    Map<String, dynamic>? info
  }) => RespDetector(
    id: id ?? this.id,
    type: type ?? this.type,
    alias: alias ?? this.alias,
    info: info ?? this.info,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RespDetector && id == other.id && type == other.type && alias == other.alias && info == other.info;

  @override
  int get hashCode => id.hashCode ^ type.hashCode ^ alias.hashCode ^ info.hashCode;
}
