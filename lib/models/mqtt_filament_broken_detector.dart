import 'package:filamentor_app/models/detector.dart';

class MqttFilamentBrokenDetector extends Detector {
  final String mqttServer;

  MqttFilamentBrokenDetector({
    required super.id,
    required this.mqttServer,
  });

  @override
  String get info => '打印机自带的耗材检测只能判断耗材离开打印头，所以在换色退料时无法精确得知耗材是否退到安全距离（比如说退出五通），增加断料检测器可以有效改善耗材状态判断的准确性，同时可以应用到耗材续料等功能（待发布）\n\n本检测器通过 MQTT 通讯，需要你有可以使用的 MQTT 服务器';

  @override
  String get name => 'MQTT 断料检测器';

  @override
  String get url => 'https://github.com/TshineZheng/Filamentor';
  
  @override
  String get shortInfo => '服务器: $mqttServer';
}
