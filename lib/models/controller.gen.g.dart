// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.gen.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Controller on ControllerBase, Store {
  late final _$idAtom = Atom(name: 'ControllerBase.id', context: context);

  @override
  String get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$aliasAtom = Atom(name: 'ControllerBase.alias', context: context);

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

  late final _$typeAtom = Atom(name: 'ControllerBase.type', context: context);

  @override
  String get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(String value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  late final _$desAtom = Atom(name: 'ControllerBase.des', context: context);

  @override
  String get des {
    _$desAtom.reportRead();
    return super.des;
  }

  @override
  set des(String value) {
    _$desAtom.reportWrite(value, super.des, () {
      super.des = value;
    });
  }

  late final _$channelsAtom =
      Atom(name: 'ControllerBase.channels', context: context);

  @override
  ObservableList<Channel> get channels {
    _$channelsAtom.reportRead();
    return super.channels;
  }

  @override
  set channels(ObservableList<Channel> value) {
    _$channelsAtom.reportWrite(value, super.channels, () {
      super.channels = value;
    });
  }

  @override
  String toString() {
    return '''
id: ${id},
alias: ${alias},
type: ${type},
des: ${des},
channels: ${channels}
    ''';
  }
}
