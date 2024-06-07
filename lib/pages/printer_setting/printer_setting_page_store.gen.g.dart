// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'printer_setting_page_store.gen.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PrinterSettingPageStore on PrinterSettingPageStoreBase, Store {
  Computed<bool>? _$progressComputed;

  @override
  bool get progress =>
      (_$progressComputed ??= Computed<bool>(() => super.progress,
              name: 'PrinterSettingPageStoreBase.progress'))
          .value;

  late final _$ipAtom =
      Atom(name: 'PrinterSettingPageStoreBase.ip', context: context);

  @override
  String get ip {
    _$ipAtom.reportRead();
    return super.ip;
  }

  @override
  set ip(String value) {
    _$ipAtom.reportWrite(value, super.ip, () {
      super.ip = value;
    });
  }

  late final _$lanPWDAtom =
      Atom(name: 'PrinterSettingPageStoreBase.lanPWD', context: context);

  @override
  String get lanPWD {
    _$lanPWDAtom.reportRead();
    return super.lanPWD;
  }

  @override
  set lanPWD(String value) {
    _$lanPWDAtom.reportWrite(value, super.lanPWD, () {
      super.lanPWD = value;
    });
  }

  late final _$deviceSerialAtom =
      Atom(name: 'PrinterSettingPageStoreBase.deviceSerial', context: context);

  @override
  String get deviceSerial {
    _$deviceSerialAtom.reportRead();
    return super.deviceSerial;
  }

  @override
  set deviceSerial(String value) {
    _$deviceSerialAtom.reportWrite(value, super.deviceSerial, () {
      super.deviceSerial = value;
    });
  }

  late final _$aliasAtom =
      Atom(name: 'PrinterSettingPageStoreBase.alias', context: context);

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

  late final _$fetchConfigAtom =
      Atom(name: 'PrinterSettingPageStoreBase.fetchConfig', context: context);

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
      Atom(name: 'PrinterSettingPageStoreBase.fetchDelete', context: context);

  @override
  ObservableFuture<ApiResult<dynamic>> get fetchDelete {
    _$fetchDeleteAtom.reportRead();
    return super.fetchDelete;
  }

  @override
  set fetchDelete(ObservableFuture<ApiResult<dynamic>> value) {
    _$fetchDeleteAtom.reportWrite(value, super.fetchDelete, () {
      super.fetchDelete = value;
    });
  }

  late final _$fetchAddPrinterAtom = Atom(
      name: 'PrinterSettingPageStoreBase.fetchAddPrinter', context: context);

  @override
  ObservableFuture<ApiResult<dynamic>> get fetchAddPrinter {
    _$fetchAddPrinterAtom.reportRead();
    return super.fetchAddPrinter;
  }

  @override
  set fetchAddPrinter(ObservableFuture<ApiResult<dynamic>> value) {
    _$fetchAddPrinterAtom.reportWrite(value, super.fetchAddPrinter, () {
      super.fetchAddPrinter = value;
    });
  }

  late final _$loadDataAsyncAction =
      AsyncAction('PrinterSettingPageStoreBase.loadData', context: context);

  @override
  Future<void> loadData() {
    return _$loadDataAsyncAction.run(() => super.loadData());
  }

  late final _$deleteAsyncAction =
      AsyncAction('PrinterSettingPageStoreBase.delete', context: context);

  @override
  Future<void> delete() {
    return _$deleteAsyncAction.run(() => super.delete());
  }

  late final _$createAsyncAction =
      AsyncAction('PrinterSettingPageStoreBase.create', context: context);

  @override
  Future<void> create(
      String ip, String lanPWD, String deviceSerial, String alias) {
    return _$createAsyncAction
        .run(() => super.create(ip, lanPWD, deviceSerial, alias));
  }

  @override
  String toString() {
    return '''
ip: ${ip},
lanPWD: ${lanPWD},
deviceSerial: ${deviceSerial},
alias: ${alias},
fetchConfig: ${fetchConfig},
fetchDelete: ${fetchDelete},
fetchAddPrinter: ${fetchAddPrinter},
progress: ${progress}
    ''';
  }
}
