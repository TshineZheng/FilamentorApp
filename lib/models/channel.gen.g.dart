// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel.gen.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Channel on ChannelBase, Store {
  Computed<Color>? _$filamentColorComputed;

  @override
  Color get filamentColor =>
      (_$filamentColorComputed ??= Computed<Color>(() => super.filamentColor,
              name: 'ChannelBase.filamentColor'))
          .value;
  Computed<String>? _$filamentTypeComputed;

  @override
  String get filamentType =>
      (_$filamentTypeComputed ??= Computed<String>(() => super.filamentType,
              name: 'ChannelBase.filamentType'))
          .value;

  late final _$_filamentTypeAtom =
      Atom(name: 'ChannelBase._filamentType', context: context);

  @override
  String? get _filamentType {
    _$_filamentTypeAtom.reportRead();
    return super._filamentType;
  }

  @override
  set _filamentType(String? value) {
    _$_filamentTypeAtom.reportWrite(value, super._filamentType, () {
      super._filamentType = value;
    });
  }

  late final _$_filamentColorAtom =
      Atom(name: 'ChannelBase._filamentColor', context: context);

  @override
  String? get _filamentColor {
    _$_filamentColorAtom.reportRead();
    return super._filamentColor;
  }

  @override
  set _filamentColor(String? value) {
    _$_filamentColorAtom.reportWrite(value, super._filamentColor, () {
      super._filamentColor = value;
    });
  }

  late final _$stateAtom = Atom(name: 'ChannelBase.state', context: context);

  @override
  int get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(int value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  @override
  String toString() {
    return '''
state: ${state},
filamentColor: ${filamentColor},
filamentType: ${filamentType}
    ''';
  }
}
