// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'printer_page_store.gen.dart';

// **************************************************************************
// LCEGenerator
// **************************************************************************

extension PrinterPageStoreBaseCatchExt on PrinterPageStoreBase {
  Future<void> loadConfig$retry() async {
    try {
      return await loadConfig();
    } catch (e) {
      showRetry(
        e.toString(),
        onRetry: () => loadConfig$retry(),
        title: null,
      );
    }
  }

  Future<void> control$retry(
      String controllerId, int channel, int action) async {
    try {
      return await control(controllerId, channel, action);
    } catch (e) {
      showRetry(
        e.toString(),
        onRetry: () => control$retry(controllerId, channel, action),
        title: null,
      );
    }
  }

  Future<void> setCurFila$retry(int value) async {
    try {
      return await setCurFila(value);
    } catch (e) {
      showRetry(
        e.toString(),
        onRetry: () => setCurFila$retry(value),
        title: null,
      );
    }
  }

  Future<void> setFilaChangeTemp$retry(int value) async {
    try {
      return await setFilaChangeTemp(value);
    } catch (e) {
      showRetry(
        e.toString(),
        onRetry: () => setFilaChangeTemp$retry(value),
        title: null,
      );
    }
  }
}

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PrinterPageStore on PrinterPageStoreBase, Store {
  Computed<bool>? _$progressComputed;

  @override
  bool get progress =>
      (_$progressComputed ??= Computed<bool>(() => super.progress,
              name: 'PrinterPageStoreBase.progress'))
          .value;

  late final _$fetchConfigAtom =
      Atom(name: 'PrinterPageStoreBase.fetchConfig', context: context);

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

  late final _$fetchControlAtom =
      Atom(name: 'PrinterPageStoreBase.fetchControl', context: context);

  @override
  ObservableFuture<ApiResult<dynamic>> get fetchControl {
    _$fetchControlAtom.reportRead();
    return super.fetchControl;
  }

  @override
  set fetchControl(ObservableFuture<ApiResult<dynamic>> value) {
    _$fetchControlAtom.reportWrite(value, super.fetchControl, () {
      super.fetchControl = value;
    });
  }

  late final _$fetchSaveCurFilaAtom =
      Atom(name: 'PrinterPageStoreBase.fetchSaveCurFila', context: context);

  @override
  ObservableFuture<ApiResult<dynamic>> get fetchSaveCurFila {
    _$fetchSaveCurFilaAtom.reportRead();
    return super.fetchSaveCurFila;
  }

  @override
  set fetchSaveCurFila(ObservableFuture<ApiResult<dynamic>> value) {
    _$fetchSaveCurFilaAtom.reportWrite(value, super.fetchSaveCurFila, () {
      super.fetchSaveCurFila = value;
    });
  }

  late final _$fetchSaveFilaChangeTempAtom = Atom(
      name: 'PrinterPageStoreBase.fetchSaveFilaChangeTemp', context: context);

  @override
  ObservableFuture<ApiResult<dynamic>> get fetchSaveFilaChangeTemp {
    _$fetchSaveFilaChangeTempAtom.reportRead();
    return super.fetchSaveFilaChangeTemp;
  }

  @override
  set fetchSaveFilaChangeTemp(ObservableFuture<ApiResult<dynamic>> value) {
    _$fetchSaveFilaChangeTempAtom
        .reportWrite(value, super.fetchSaveFilaChangeTemp, () {
      super.fetchSaveFilaChangeTemp = value;
    });
  }

  late final _$fetchSyncAtom =
      Atom(name: 'PrinterPageStoreBase.fetchSync', context: context);

  @override
  ObservableFuture<ApiResult<RespSync>> get fetchSync {
    _$fetchSyncAtom.reportRead();
    return super.fetchSync;
  }

  @override
  set fetchSync(ObservableFuture<ApiResult<RespSync>> value) {
    _$fetchSyncAtom.reportWrite(value, super.fetchSync, () {
      super.fetchSync = value;
    });
  }

  late final _$fetchUnbindChannelAtom =
      Atom(name: 'PrinterPageStoreBase.fetchUnbindChannel', context: context);

  @override
  ObservableFuture<ApiResult<dynamic>> get fetchUnbindChannel {
    _$fetchUnbindChannelAtom.reportRead();
    return super.fetchUnbindChannel;
  }

  @override
  set fetchUnbindChannel(ObservableFuture<ApiResult<dynamic>> value) {
    _$fetchUnbindChannelAtom.reportWrite(value, super.fetchUnbindChannel, () {
      super.fetchUnbindChannel = value;
    });
  }

  late final _$fetchEditFilamentAtom =
      Atom(name: 'PrinterPageStoreBase.fetchEditFilament', context: context);

  @override
  ObservableFuture<ApiResult<dynamic>> get fetchEditFilament {
    _$fetchEditFilamentAtom.reportRead();
    return super.fetchEditFilament;
  }

  @override
  set fetchEditFilament(ObservableFuture<ApiResult<dynamic>> value) {
    _$fetchEditFilamentAtom.reportWrite(value, super.fetchEditFilament, () {
      super.fetchEditFilament = value;
    });
  }

  late final _$configAtom =
      Atom(name: 'PrinterPageStoreBase.config', context: context);

  @override
  RespConfig? get config {
    _$configAtom.reportRead();
    return super.config;
  }

  @override
  set config(RespConfig? value) {
    _$configAtom.reportWrite(value, super.config, () {
      super.config = value;
    });
  }

  late final _$printerIdAtom =
      Atom(name: 'PrinterPageStoreBase.printerId', context: context);

  @override
  String get printerId {
    _$printerIdAtom.reportRead();
    return super.printerId;
  }

  @override
  set printerId(String value) {
    _$printerIdAtom.reportWrite(value, super.printerId, () {
      super.printerId = value;
    });
  }

  late final _$printerIpAtom =
      Atom(name: 'PrinterPageStoreBase.printerIp', context: context);

  @override
  String get printerIp {
    _$printerIpAtom.reportRead();
    return super.printerIp;
  }

  @override
  set printerIp(String value) {
    _$printerIpAtom.reportWrite(value, super.printerIp, () {
      super.printerIp = value;
    });
  }

  late final _$printerTypeAtom =
      Atom(name: 'PrinterPageStoreBase.printerType', context: context);

  @override
  String get printerType {
    _$printerTypeAtom.reportRead();
    return super.printerType;
  }

  @override
  set printerType(String value) {
    _$printerTypeAtom.reportWrite(value, super.printerType, () {
      super.printerType = value;
    });
  }

  late final _$aliasAtom =
      Atom(name: 'PrinterPageStoreBase.alias', context: context);

  @override
  String get alias {
    _$aliasAtom.reportRead();
    return super.alias;
  }

  @override
  set alias(String value) {
    _$aliasAtom.reportWrite(value, super.alias, () {
      super.alias = value;
    });
  }

  late final _$channelListAtom =
      Atom(name: 'PrinterPageStoreBase.channelList', context: context);

  @override
  ObservableList<Channel> get channelList {
    _$channelListAtom.reportRead();
    return super.channelList;
  }

  @override
  set channelList(ObservableList<Channel> value) {
    _$channelListAtom.reportWrite(value, super.channelList, () {
      super.channelList = value;
    });
  }

  late final _$detectorListAtom =
      Atom(name: 'PrinterPageStoreBase.detectorList', context: context);

  @override
  ObservableList<printer_detector.Detector> get detectorList {
    _$detectorListAtom.reportRead();
    return super.detectorList;
  }

  @override
  set detectorList(ObservableList<printer_detector.Detector> value) {
    _$detectorListAtom.reportWrite(value, super.detectorList, () {
      super.detectorList = value;
    });
  }

  late final _$curFilaAtom =
      Atom(name: 'PrinterPageStoreBase.curFila', context: context);

  @override
  int get curFila {
    _$curFilaAtom.reportRead();
    return super.curFila;
  }

  @override
  set curFila(int value) {
    _$curFilaAtom.reportWrite(value, super.curFila, () {
      super.curFila = value;
    });
  }

  late final _$filaChangeTempAtom =
      Atom(name: 'PrinterPageStoreBase.filaChangeTemp', context: context);

  @override
  int get filaChangeTemp {
    _$filaChangeTempAtom.reportRead();
    return super.filaChangeTemp;
  }

  @override
  set filaChangeTemp(int value) {
    _$filaChangeTempAtom.reportWrite(value, super.filaChangeTemp, () {
      super.filaChangeTemp = value;
    });
  }

  late final _$loadConfigAsyncAction =
      AsyncAction('PrinterPageStoreBase.loadConfig', context: context);

  @override
  Future<void> loadConfig() {
    return _$loadConfigAsyncAction.run(() => super.loadConfig());
  }

  late final _$controlAsyncAction =
      AsyncAction('PrinterPageStoreBase.control', context: context);

  @override
  Future<void> control(String controllerId, int channel, int action) {
    return _$controlAsyncAction
        .run(() => super.control(controllerId, channel, action));
  }

  late final _$setCurFilaAsyncAction =
      AsyncAction('PrinterPageStoreBase.setCurFila', context: context);

  @override
  Future<void> setCurFila(int value) {
    return _$setCurFilaAsyncAction.run(() => super.setCurFila(value));
  }

  late final _$setFilaChangeTempAsyncAction =
      AsyncAction('PrinterPageStoreBase.setFilaChangeTemp', context: context);

  @override
  Future<void> setFilaChangeTemp(int value) {
    return _$setFilaChangeTempAsyncAction
        .run(() => super.setFilaChangeTemp(value));
  }

  late final _$syncAsyncAction =
      AsyncAction('PrinterPageStoreBase.sync', context: context);

  @override
  Future<void> sync() {
    return _$syncAsyncAction.run(() => super.sync());
  }

  late final _$refreshAsyncAction =
      AsyncAction('PrinterPageStoreBase.refresh', context: context);

  @override
  Future<void> refresh(void Function(String) onDone) {
    return _$refreshAsyncAction.run(() => super.refresh(onDone));
  }

  late final _$unbindChannelAsyncAction =
      AsyncAction('PrinterPageStoreBase.unbindChannel', context: context);

  @override
  Future<void> unbindChannel(dynamic controllerId, dynamic channel) {
    return _$unbindChannelAsyncAction
        .run(() => super.unbindChannel(controllerId, channel));
  }

  late final _$editChannelFilamenteAsyncAction = AsyncAction(
      'PrinterPageStoreBase.editChannelFilamente',
      context: context);

  @override
  Future<void> editChannelFilamente(
      {required Channel channel,
      required String filaType,
      required Color color,
      required int printerChannel}) {
    return _$editChannelFilamenteAsyncAction.run(() => super
        .editChannelFilamente(
            channel: channel,
            filaType: filaType,
            color: color,
            printerChannel: printerChannel));
  }

  @override
  String toString() {
    return '''
fetchConfig: ${fetchConfig},
fetchControl: ${fetchControl},
fetchSaveCurFila: ${fetchSaveCurFila},
fetchSaveFilaChangeTemp: ${fetchSaveFilaChangeTemp},
fetchSync: ${fetchSync},
fetchUnbindChannel: ${fetchUnbindChannel},
fetchEditFilament: ${fetchEditFilament},
config: ${config},
printerId: ${printerId},
printerIp: ${printerIp},
printerType: ${printerType},
alias: ${alias},
channelList: ${channelList},
detectorList: ${detectorList},
curFila: ${curFila},
filaChangeTemp: ${filaChangeTemp},
progress: ${progress}
    ''';
  }
}
