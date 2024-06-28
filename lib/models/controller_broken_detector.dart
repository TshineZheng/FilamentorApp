import 'package:filamentor_app/models/detector.gen.dart';

class ControllerBrokenDetector extends Detector {
  final String controllerAlias;
  final double safeTime;
  ControllerBrokenDetector({
    required super.id,
    required this.controllerAlias,
    required this.safeTime,
  });

  @override
  String get info => '来自 控制器 $controllerAlias 的断料检测器，用于判断该控制器上的耗材状态。\n退料安全时间: $safeTime 秒';

  @override
  String get name => '$controllerAlias 断料检测';

  @override
  String get shortInfo => '控制器 $controllerAlias 断料检测器';
}
