// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_edit_page_store.gen.dart';

// **************************************************************************
// LCEGenerator
// **************************************************************************

extension ControllerEditPageStoreBaseCatchExt on ControllerEditPageStoreBase {
  Future<void> create$catch(String type, String name, String ip,
      int totalChannel, double filaBrokenSafetime) async {
    try {
      return await create(type, name, ip, totalChannel, filaBrokenSafetime);
    } catch (e) {
      showMessage("创建失败\n${e.toString()}");
    }
  }
}

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ControllerEditPageStore on ControllerEditPageStoreBase, Store {
  Computed<bool>? _$progressComputed;

  @override
  bool get progress =>
      (_$progressComputed ??= Computed<bool>(() => super.progress,
              name: 'ControllerEditPageStoreBase.progress'))
          .value;

  late final _$fetchAddControllerAtom = Atom(
      name: 'ControllerEditPageStoreBase.fetchAddController', context: context);

  @override
  ObservableFuture<ApiResult<dynamic>> get fetchAddController {
    _$fetchAddControllerAtom.reportRead();
    return super.fetchAddController;
  }

  @override
  set fetchAddController(ObservableFuture<ApiResult<dynamic>> value) {
    _$fetchAddControllerAtom.reportWrite(value, super.fetchAddController, () {
      super.fetchAddController = value;
    });
  }

  late final _$createAsyncAction =
      AsyncAction('ControllerEditPageStoreBase.create', context: context);

  @override
  Future<void> create(String type, String name, String ip, int totalChannel,
      double filaBrokenSafetime) {
    return _$createAsyncAction.run(
        () => super.create(type, name, ip, totalChannel, filaBrokenSafetime));
  }

  @override
  String toString() {
    return '''
fetchAddController: ${fetchAddController},
progress: ${progress}
    ''';
  }
}
