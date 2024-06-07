// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_page_store.gen.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashPageStore on SplashPageStoreBase, Store {
  Computed<bool>? _$successComputed;

  @override
  bool get success => (_$successComputed ??= Computed<bool>(() => super.success,
          name: 'SplashPageStoreBase.success'))
      .value;

  late final _$dataLoadedAtom =
      Atom(name: 'SplashPageStoreBase.dataLoaded', context: context);

  @override
  bool get dataLoaded {
    _$dataLoadedAtom.reportRead();
    return super.dataLoaded;
  }

  @override
  set dataLoaded(bool value) {
    _$dataLoadedAtom.reportWrite(value, super.dataLoaded, () {
      super.dataLoaded = value;
    });
  }

  late final _$loadDataAsyncAction =
      AsyncAction('SplashPageStoreBase.loadData', context: context);

  @override
  Future<dynamic> loadData() {
    return _$loadDataAsyncAction.run(() => super.loadData());
  }

  @override
  String toString() {
    return '''
dataLoaded: ${dataLoaded},
success: ${success}
    ''';
  }
}
