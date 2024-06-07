// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_list_page_store.gen.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ControllerListPageStore on ControllerListPageStoreBase, Store {
  Computed<bool>? _$progressComputed;

  @override
  bool get progress =>
      (_$progressComputed ??= Computed<bool>(() => super.progress,
              name: 'ControllerListPageStoreBase.progress'))
          .value;

  late final _$fetchConfigAtom =
      Atom(name: 'ControllerListPageStoreBase.fetchConfig', context: context);

  @override
  ObservableFuture<ApiResult<RespConfig>> get fetchConfig {
    _$fetchConfigAtom.reportRead();
    return super.fetchConfig;
  }

  @override
  set fetchConfig(ObservableFuture<ApiResult<RespConfig>> value) {
    _$fetchConfigAtom.reportWrite(value, super.fetchConfig, () {
      super.fetchConfig = value;
    });
  }

  late final _$fetchDeleteAtom =
      Atom(name: 'ControllerListPageStoreBase.fetchDelete', context: context);

  @override
  ObservableFuture<ApiResult<void>> get fetchDelete {
    _$fetchDeleteAtom.reportRead();
    return super.fetchDelete;
  }

  @override
  set fetchDelete(ObservableFuture<ApiResult<void>> value) {
    _$fetchDeleteAtom.reportWrite(value, super.fetchDelete, () {
      super.fetchDelete = value;
    });
  }

  late final _$controllerListAtom = Atom(
      name: 'ControllerListPageStoreBase.controllerList', context: context);

  @override
  ObservableList<Controller> get controllerList {
    _$controllerListAtom.reportRead();
    return super.controllerList;
  }

  @override
  set controllerList(ObservableList<Controller> value) {
    _$controllerListAtom.reportWrite(value, super.controllerList, () {
      super.controllerList = value;
    });
  }

  late final _$loadDataAsyncAction =
      AsyncAction('ControllerListPageStoreBase.loadData', context: context);

  @override
  Future<void> loadData() {
    return _$loadDataAsyncAction.run(() => super.loadData());
  }

  late final _$deleteAsyncAction =
      AsyncAction('ControllerListPageStoreBase.delete', context: context);

  @override
  Future<void> delete(String controllerId) {
    return _$deleteAsyncAction.run(() => super.delete(controllerId));
  }

  @override
  String toString() {
    return '''
fetchConfig: ${fetchConfig},
fetchDelete: ${fetchDelete},
controllerList: ${controllerList},
progress: ${progress}
    ''';
  }
}
