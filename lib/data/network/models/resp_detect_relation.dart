import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class RespDetectRelation {

  const RespDetectRelation({
    required this.printerId,
    required this.detectId,
  });

  final String printerId;
  final String detectId;

  factory RespDetectRelation.fromJson(Map<String,dynamic> json) => RespDetectRelation(
    printerId: json['printer_id'].toString(),
    detectId: json['detect_id'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'printer_id': printerId,
    'detect_id': detectId
  };

  RespDetectRelation clone() => RespDetectRelation(
    printerId: printerId,
    detectId: detectId
  );


  RespDetectRelation copyWith({
    String? printerId,
    String? detectId
  }) => RespDetectRelation(
    printerId: printerId ?? this.printerId,
    detectId: detectId ?? this.detectId,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RespDetectRelation && printerId == other.printerId && detectId == other.detectId;

  @override
  int get hashCode => printerId.hashCode ^ detectId.hashCode;
}
