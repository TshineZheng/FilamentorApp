abstract class Detector {
  Detector({required this.id});

  String get info;

  String get shortInfo;

  String get name;

  String get url;

  final String id;
}

class DefaultDetector extends Detector{
  DefaultDetector({required super.id});

  @override
  String get info => '默认检测器';

  @override
  String get name => '检测器';

  @override
  String get url => '';
  
  @override
  String get shortInfo => '默认检测器';


}
