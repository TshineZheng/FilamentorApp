import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class RespControllerYbaAmsInfo {

  const RespControllerYbaAmsInfo({
    required this.ip,
    required this.port,
    required this.channelTotal,
  });

  final String ip;
  final int port;
  final int channelTotal;

  factory RespControllerYbaAmsInfo.fromJson(Map<String,dynamic> json) => RespControllerYbaAmsInfo(
    ip: json['ip'].toString(),
    port: json['port'] as int,
    channelTotal: json['channel_total'] as int
  );
  
  Map<String, dynamic> toJson() => {
    'ip': ip,
    'port': port,
    'channel_total': channelTotal
  };

  RespControllerYbaAmsInfo clone() => RespControllerYbaAmsInfo(
    ip: ip,
    port: port,
    channelTotal: channelTotal
  );


  RespControllerYbaAmsInfo copyWith({
    String? ip,
    int? port,
    int? channelTotal
  }) => RespControllerYbaAmsInfo(
    ip: ip ?? this.ip,
    port: port ?? this.port,
    channelTotal: channelTotal ?? this.channelTotal,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RespControllerYbaAmsInfo && ip == other.ip && port == other.port && channelTotal == other.channelTotal;

  @override
  int get hashCode => ip.hashCode ^ port.hashCode ^ channelTotal.hashCode;
}
