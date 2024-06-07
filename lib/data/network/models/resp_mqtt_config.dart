import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class RespMqttConfig {

  const RespMqttConfig({
    required this.server,
    required this.port,
    required this.clientId,
    required this.username,
    required this.password,
  });

  final String server;
  final int port;
  final String clientId;
  final String username;
  final String password;

  factory RespMqttConfig.fromJson(Map<String,dynamic> json) => RespMqttConfig(
    server: json['server'].toString(),
    port: json['port'] as int,
    clientId: json['client_id'].toString(),
    username: json['username'].toString(),
    password: json['password'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'server': server,
    'port': port,
    'client_id': clientId,
    'username': username,
    'password': password
  };

  RespMqttConfig clone() => RespMqttConfig(
    server: server,
    port: port,
    clientId: clientId,
    username: username,
    password: password
  );


  RespMqttConfig copyWith({
    String? server,
    int? port,
    String? clientId,
    String? username,
    String? password
  }) => RespMqttConfig(
    server: server ?? this.server,
    port: port ?? this.port,
    clientId: clientId ?? this.clientId,
    username: username ?? this.username,
    password: password ?? this.password,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RespMqttConfig && server == other.server && port == other.port && clientId == other.clientId && username == other.username && password == other.password;

  @override
  int get hashCode => server.hashCode ^ port.hashCode ^ clientId.hashCode ^ username.hashCode ^ password.hashCode;
}
