import 'package:filamentor_app/app.dart';
import 'package:filamentor_app/common/base/base_page_store.dart';
import 'package:flutter/widgets.dart';
import 'package:lce/lce.dart';

abstract class BasePageState<W extends StatefulWidget, S extends BasePageStore> extends LCEState<W, S> {

  @override
  S buildStore() => gain<S>();
}