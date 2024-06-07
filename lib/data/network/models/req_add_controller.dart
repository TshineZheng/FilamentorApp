import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class ReqAddController {

  const ReqAddController({
    required this.type,
    required this.alias,
    required this.info,
  });

  final String type;
  final String alias;
  final dynamic info;

  factory ReqAddController.fromJson(Map<String,dynamic> json) => ReqAddController(
    type: json['type'].toString(),
    alias: json['alias'].toString(),
    info: json['info'] as dynamic
  );
  
  Map<String, dynamic> toJson() => {
    'type': type,
    'alias': alias,
    'info': info
  };

  ReqAddController clone() => ReqAddController(
    type: type,
    alias: alias,
    info: info
  );


  ReqAddController copyWith({
    String? type,
    String? alias,
    dynamic? info
  }) => ReqAddController(
    type: type ?? this.type,
    alias: alias ?? this.alias,
    info: info ?? this.info,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ReqAddController && type == other.type && alias == other.alias && info == other.info;

  @override
  int get hashCode => type.hashCode ^ alias.hashCode ^ info.hashCode;
}
