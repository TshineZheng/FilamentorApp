import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class Storage {
  @factoryMethod
  static Storage create(SharedPreferences sp) => Storage(sp);

  final SharedPreferences preferences;

  Storage(this.preferences);

  String get filamentorUrl => preferences.getString('filamentor_url') ?? '';
  set filamentorUrl(String url) => preferences.setString('filamentor_url', url);

  int get filamentorPort => preferences.getInt('filamentor_port') ?? 7170;
  set filamentorPort(int port) => preferences.setInt('filamentor_port', port);

  bool get filaChannelGuide => preferences.getBool('filaChannelGuide') ?? false;
  set filaChannelGuide(bool guide) => preferences.setBool('filaChannelGuide', guide);
}
