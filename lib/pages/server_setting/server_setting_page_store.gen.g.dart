// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_setting_page_store.gen.dart';

// **************************************************************************
// LCEGenerator
// **************************************************************************

extension ServerSettingPageStoreBaseCatchExt on ServerSettingPageStoreBase {
  Future<void> submit$$catch(String server, int port) async {
    try {
      return await submit(server, port);
    } catch (e) {
      showMessageDialog(
        e.toString(),
        title: "服务器连接验证失败",
      );
    }
  }
}

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ServerSettingPageStore on ServerSettingPageStoreBase, Store {
  Computed<bool>? _$progressComputed;

  @override
  bool get progress =>
      (_$progressComputed ??= Computed<bool>(() => super.progress,
              name: 'ServerSettingPageStoreBase.progress'))
          .value;

  late final _$fetchCheckAtom =
      Atom(name: 'ServerSettingPageStoreBase.fetchCheck', context: context);

  @override
  ObservableFuture<bool> get fetchCheck {
    _$fetchCheckAtom.reportRead();
    return super.fetchCheck;
  }

  @override
  set fetchCheck(ObservableFuture<bool> value) {
    _$fetchCheckAtom.reportWrite(value, super.fetchCheck, () {
      super.fetchCheck = value;
    });
  }

  late final _$serverUrlAtom =
      Atom(name: 'ServerSettingPageStoreBase.serverUrl', context: context);

  @override
  String get serverUrl {
    _$serverUrlAtom.reportRead();
    return super.serverUrl;
  }

  @override
  set serverUrl(String value) {
    _$serverUrlAtom.reportWrite(value, super.serverUrl, () {
      super.serverUrl = value;
    });
  }

  late final _$serverPortAtom =
      Atom(name: 'ServerSettingPageStoreBase.serverPort', context: context);

  @override
  int get serverPort {
    _$serverPortAtom.reportRead();
    return super.serverPort;
  }

  @override
  set serverPort(int value) {
    _$serverPortAtom.reportWrite(value, super.serverPort, () {
      super.serverPort = value;
    });
  }

  late final _$useSSLAtom =
      Atom(name: 'ServerSettingPageStoreBase.useSSL', context: context);

  @override
  bool get useSSL {
    _$useSSLAtom.reportRead();
    return super.useSSL;
  }

  @override
  set useSSL(bool value) {
    _$useSSLAtom.reportWrite(value, super.useSSL, () {
      super.useSSL = value;
    });
  }

  late final _$loadDataAsyncAction =
      AsyncAction('ServerSettingPageStoreBase.loadData', context: context);

  @override
  Future<void> loadData() {
    return _$loadDataAsyncAction.run(() => super.loadData());
  }

  late final _$submitAsyncAction =
      AsyncAction('ServerSettingPageStoreBase.submit', context: context);

  @override
  Future<void> submit(String server, int port) {
    return _$submitAsyncAction.run(() => super.submit(server, port));
  }

  late final _$checkAsyncAction =
      AsyncAction('ServerSettingPageStoreBase.check', context: context);

  @override
  Future<bool> check(String server, int port) {
    return _$checkAsyncAction.run(() => super.check(server, port));
  }

  @override
  String toString() {
    return '''
fetchCheck: ${fetchCheck},
serverUrl: ${serverUrl},
serverPort: ${serverPort},
useSSL: ${useSSL},
progress: ${progress}
    ''';
  }
}
