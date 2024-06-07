// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_channel_page_store.gen.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddChannelPageStore on AddChannelPageStoreBase, Store {
  Computed<bool>? _$progressComputed;

  @override
  bool get progress =>
      (_$progressComputed ??= Computed<bool>(() => super.progress,
              name: 'AddChannelPageStoreBase.progress'))
          .value;
  Computed<ObservableList<Channel>>? _$unusedChannelComputed;

  @override
  ObservableList<Channel> get unusedChannel => (_$unusedChannelComputed ??=
          Computed<ObservableList<Channel>>(() => super.unusedChannel,
              name: 'AddChannelPageStoreBase.unusedChannel'))
      .value;
  Computed<bool>? _$isSelectedComputed;

  @override
  bool get isSelected =>
      (_$isSelectedComputed ??= Computed<bool>(() => super.isSelected,
              name: 'AddChannelPageStoreBase.isSelected'))
          .value;

  late final _$fetchConfigAtom =
      Atom(name: 'AddChannelPageStoreBase.fetchConfig', context: context);

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

  late final _$fetchBindChannelAtom =
      Atom(name: 'AddChannelPageStoreBase.fetchBindChannel', context: context);

  @override
  ObservableFuture<ApiResult<dynamic>> get fetchBindChannel {
    _$fetchBindChannelAtom.reportRead();
    return super.fetchBindChannel;
  }

  @override
  set fetchBindChannel(ObservableFuture<ApiResult<dynamic>> value) {
    _$fetchBindChannelAtom.reportWrite(value, super.fetchBindChannel, () {
      super.fetchBindChannel = value;
    });
  }

  late final _$controllersAtom =
      Atom(name: 'AddChannelPageStoreBase.controllers', context: context);

  @override
  ObservableList<Controller> get controllers {
    _$controllersAtom.reportRead();
    return super.controllers;
  }

  @override
  set controllers(ObservableList<Controller> value) {
    _$controllersAtom.reportWrite(value, super.controllers, () {
      super.controllers = value;
    });
  }

  late final _$curControllerAtom =
      Atom(name: 'AddChannelPageStoreBase.curController', context: context);

  @override
  Controller? get curController {
    _$curControllerAtom.reportRead();
    return super.curController;
  }

  @override
  set curController(Controller? value) {
    _$curControllerAtom.reportWrite(value, super.curController, () {
      super.curController = value;
    });
  }

  late final _$channelSelectedAtom =
      Atom(name: 'AddChannelPageStoreBase.channelSelected', context: context);

  @override
  ObservableList<Tuple2<int, bool>> get channelSelected {
    _$channelSelectedAtom.reportRead();
    return super.channelSelected;
  }

  @override
  set channelSelected(ObservableList<Tuple2<int, bool>> value) {
    _$channelSelectedAtom.reportWrite(value, super.channelSelected, () {
      super.channelSelected = value;
    });
  }

  late final _$dateLoadedAtom =
      Atom(name: 'AddChannelPageStoreBase.dateLoaded', context: context);

  @override
  bool get dateLoaded {
    _$dateLoadedAtom.reportRead();
    return super.dateLoaded;
  }

  @override
  set dateLoaded(bool value) {
    _$dateLoadedAtom.reportWrite(value, super.dateLoaded, () {
      super.dateLoaded = value;
    });
  }

  late final _$loadDataAsyncAction =
      AsyncAction('AddChannelPageStoreBase.loadData', context: context);

  @override
  Future<void> loadData() {
    return _$loadDataAsyncAction.run(() => super.loadData());
  }

  late final _$bindAsyncAction =
      AsyncAction('AddChannelPageStoreBase.bind', context: context);

  @override
  Future<void> bind() {
    return _$bindAsyncAction.run(() => super.bind());
  }

  @override
  String toString() {
    return '''
fetchConfig: ${fetchConfig},
fetchBindChannel: ${fetchBindChannel},
controllers: ${controllers},
curController: ${curController},
channelSelected: ${channelSelected},
dateLoaded: ${dateLoaded},
progress: ${progress},
unusedChannel: ${unusedChannel},
isSelected: ${isSelected}
    ''';
  }
}
