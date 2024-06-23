
import 'package:mobx/mobx.dart';

part 'detector.gen.g.dart';

class Detector = DetectorBase with _$Detector;

abstract class DetectorBase with Store {
  DetectorBase({required this.id});

  
  String get info=> '默认检测器';

  String get shortInfo=> '默认检测器';

  String get name => '检测器';

  String get url => '';

  final String id;

  @observable
  bool isBroken = false;
}
