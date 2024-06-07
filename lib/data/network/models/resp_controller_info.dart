import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class RespControllerInfo {

  const RespControllerInfo({
    required this.ip,
    required this.port,
    required this.channelTotal,
  });

  final String ip;
  final int port;
  final int channelTotal;

  factory RespControllerInfo.fromJson(Map<String,dynamic> json) => RespControllerInfo(
    ip: json['ip'].toString(),
    port: json['port'] as int,
    channelTotal: json['channel_total'] as int
  );
  
  Map<String, dynamic> toJson() => {
    'ip': ip,
    'port': port,
    'channel_total': channelTotal
  };

  RespControllerInfo clone() => RespControllerInfo(
    ip: ip,
    port: port,
    channelTotal: channelTotal
  );


  RespControllerInfo copyWith({
    String? ip,
    int? port,
    int? channelTotal
  }) => RespControllerInfo(
    ip: ip ?? this.ip,
    port: port ?? this.port,
    channelTotal: channelTotal ?? this.channelTotal,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RespControllerInfo && ip == other.ip && port == other.port && channelTotal == other.channelTotal;

  @override
  int get hashCode => ip.hashCode ^ port.hashCode ^ channelTotal.hashCode;
}
