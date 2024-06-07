

import 'dart:io';

import 'package:flutter/foundation.dart';

class Constants{

  static String baseUrl({required String server, required int port}){
    return '$server:$port/api/';
  }

  static bool get isDesktop => !kIsWeb && (Platform.isWindows || Platform.isMacOS || Platform.isLinux);
}