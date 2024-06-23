export 'req_add_controller.dart';
export 'resp_channel_relation.dart';
export 'resp_config.dart';
export 'resp_controller.dart';
export 'resp_controller_info.dart';
export 'resp_controller_yba_ams_info.dart';
export 'resp_detector.dart';
export 'resp_detector_info.dart';
export 'resp_detect_relation.dart';
export 'resp_mqtt_config.dart';
export 'resp_printer.dart';
export 'resp_printer_bambu_info.dart';
export 'resp_printer_info.dart';
export 'resp_sync.dart';
export 'resp_sync_ams.dart';
export 'resp_sync_controller.dart';
export 'resp_sync_detect.dart';
export 'yba_ams_info.dart';
import 'package:quiver/core.dart';

T? checkOptional<T>(Optional<T?>? optional, T? Function()? def) {
  // No value given, just take default value
  if (optional == null) return def?.call();

  // We have an input value
  if (optional.isPresent) return optional.value;

  // We have a null inside the optional
  return null;
}
