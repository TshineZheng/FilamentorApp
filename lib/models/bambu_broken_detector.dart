import 'package:filamentor_app/models/detector.gen.dart';

class BambuBrokenDetector extends Detector {
  final String printerAlias;
  final double safeTime;
  BambuBrokenDetector({
    required super.id,
    required this.printerAlias,
    required this.safeTime,
  });

  @override
  String get info => '来自打印机 $printerAlias 的断料检测器，用于判断打印机是否存在耗材。\n退料安全时间: $safeTime 秒\n当没有额外断料检测器时，会默认使用打印机的检测来判断进退料状态。';

  @override
  String get name => '$printerAlias 断料检测';

  @override
  String get shortInfo => '拓竹打印机 $printerAlias 断料检测器';
}