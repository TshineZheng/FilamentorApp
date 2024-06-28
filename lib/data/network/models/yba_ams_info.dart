import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class YbaAmsInfo {

  const YbaAmsInfo({
    required this.ip,
    required this.port,
    required this.channelTotal,
    this.filaBrokenSafeTime,
  });

  final String ip;
  final int port;
  final int channelTotal;
  final double? filaBrokenSafeTime;

  factory YbaAmsInfo.fromJson(Map<String,dynamic> json) => YbaAmsInfo(
    ip: json['ip'].toString(),
    port: json['port'] as int,
    channelTotal: json['channel_total'] as int,
    filaBrokenSafeTime: json['fila_broken_safe_time'] != null ? (json['fila_broken_safe_time'] as num).toDouble() : null
  );
  
  Map<String, dynamic> toJson() => {
    'ip': ip,
    'port': port,
    'channel_total': channelTotal,
    'fila_broken_safe_time': filaBrokenSafeTime
  };

  YbaAmsInfo clone() => YbaAmsInfo(
    ip: ip,
    port: port,
    channelTotal: channelTotal,
    filaBrokenSafeTime: filaBrokenSafeTime
  );


  YbaAmsInfo copyWith({
    String? ip,
    int? port,
    int? channelTotal,
    Optional<double?>? filaBrokenSafeTime
  }) => YbaAmsInfo(
    ip: ip ?? this.ip,
    port: port ?? this.port,
    channelTotal: channelTotal ?? this.channelTotal,
    filaBrokenSafeTime: checkOptional(filaBrokenSafeTime, () => this.filaBrokenSafeTime),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is YbaAmsInfo && ip == other.ip && port == other.port && channelTotal == other.channelTotal && filaBrokenSafeTime == other.filaBrokenSafeTime;

  @override
  int get hashCode => ip.hashCode ^ port.hashCode ^ channelTotal.hashCode ^ filaBrokenSafeTime.hashCode;
}
