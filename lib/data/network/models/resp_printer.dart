import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class RespPrinter {

  const RespPrinter({
    required this.id,
    required this.type,
    required this.info,
    required this.alias,
    required this.changeTemp,
  });

  final String id;
  final String type;
  final RespPrinterInfo info;
  final String alias;
  final int changeTemp;

  factory RespPrinter.fromJson(Map<String,dynamic> json) => RespPrinter(
    id: json['id'].toString(),
    type: json['type'].toString(),
    info: RespPrinterInfo.fromJson(json['info'] as Map<String, dynamic>),
    alias: json['alias'].toString(),
    changeTemp: json['change_temp'] as int
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'info': info.toJson(),
    'alias': alias,
    'change_temp': changeTemp
  };

  RespPrinter clone() => RespPrinter(
    id: id,
    type: type,
    info: info.clone(),
    alias: alias,
    changeTemp: changeTemp
  );


  RespPrinter copyWith({
    String? id,
    String? type,
    RespPrinterInfo? info,
    String? alias,
    int? changeTemp
  }) => RespPrinter(
    id: id ?? this.id,
    type: type ?? this.type,
    info: info ?? this.info,
    alias: alias ?? this.alias,
    changeTemp: changeTemp ?? this.changeTemp,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RespPrinter && id == other.id && type == other.type && info == other.info && alias == other.alias && changeTemp == other.changeTemp;

  @override
  int get hashCode => id.hashCode ^ type.hashCode ^ info.hashCode ^ alias.hashCode ^ changeTemp.hashCode;
}
