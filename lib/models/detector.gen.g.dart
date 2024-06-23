// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detector.gen.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Detector on DetectorBase, Store {
  late final _$isBrokenAtom =
      Atom(name: 'DetectorBase.isBroken', context: context);

  @override
  bool get isBroken {
    _$isBrokenAtom.reportRead();
    return super.isBroken;
  }

  @override
  set isBroken(bool value) {
    _$isBrokenAtom.reportWrite(value, super.isBroken, () {
      super.isBroken = value;
    });
  }

  @override
  String toString() {
    return '''
isBroken: ${isBroken}
    ''';
  }
}
