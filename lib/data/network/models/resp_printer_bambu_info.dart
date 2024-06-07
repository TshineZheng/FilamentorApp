import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class RespPrinterBambuInfo {

  const RespPrinterBambuInfo({
    required this.printerIp,
    required this.lanPassword,
    required this.deviceSerial,
  });

  final String printerIp;
  final String lanPassword;
  final String deviceSerial;

  factory RespPrinterBambuInfo.fromJson(Map<String,dynamic> json) => RespPrinterBambuInfo(
    printerIp: json['printer_ip'].toString(),
    lanPassword: json['lan_password'].toString(),
    deviceSerial: json['device_serial'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'printer_ip': printerIp,
    'lan_password': lanPassword,
    'device_serial': deviceSerial
  };

  RespPrinterBambuInfo clone() => RespPrinterBambuInfo(
    printerIp: printerIp,
    lanPassword: lanPassword,
    deviceSerial: deviceSerial
  );


  RespPrinterBambuInfo copyWith({
    String? printerIp,
    String? lanPassword,
    String? deviceSerial
  }) => RespPrinterBambuInfo(
    printerIp: printerIp ?? this.printerIp,
    lanPassword: lanPassword ?? this.lanPassword,
    deviceSerial: deviceSerial ?? this.deviceSerial,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RespPrinterBambuInfo && printerIp == other.printerIp && lanPassword == other.lanPassword && deviceSerial == other.deviceSerial;

  @override
  int get hashCode => printerIp.hashCode ^ lanPassword.hashCode ^ deviceSerial.hashCode;
}
