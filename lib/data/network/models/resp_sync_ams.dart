import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class RespSyncAms {

  const RespSyncAms({
    required this.printerId,
    required this.filaCur,
    this.curTask,
  });

  final String printerId;
  final int filaCur;
  final String? curTask;

  factory RespSyncAms.fromJson(Map<String,dynamic> json) => RespSyncAms(
    printerId: json['printer_id'].toString(),
    filaCur: json['fila_cur'] as int,
    curTask: json['cur_task']?.toString()
  );
  
  Map<String, dynamic> toJson() => {
    'printer_id': printerId,
    'fila_cur': filaCur,
    'cur_task': curTask
  };

  RespSyncAms clone() => RespSyncAms(
    printerId: printerId,
    filaCur: filaCur,
    curTask: curTask
  );


  RespSyncAms copyWith({
    String? printerId,
    int? filaCur,
    Optional<String?>? curTask
  }) => RespSyncAms(
    printerId: printerId ?? this.printerId,
    filaCur: filaCur ?? this.filaCur,
    curTask: checkOptional(curTask, () => this.curTask),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RespSyncAms && printerId == other.printerId && filaCur == other.filaCur && curTask == other.curTask;

  @override
  int get hashCode => printerId.hashCode ^ filaCur.hashCode ^ curTask.hashCode;
}
