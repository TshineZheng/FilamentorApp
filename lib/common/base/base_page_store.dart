import 'package:lce/lce.dart';

abstract class BasePageStore extends LCEStore{

  void toast(String msg) => showMessage(msg);

  void dialog(String msg) => showMessageDialog(msg);
}