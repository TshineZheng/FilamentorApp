import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class RespSyncDetect {

  const RespSyncDetect({
    required this.detectId,
    required this.isBroken,
  });

  final String detectId;
  final bool isBroken;

  factory RespSyncDetect.fromJson(Map<String,dynamic> json) => RespSyncDetect(
    detectId: json['detect_id'].toString(),
    isBroken: json['is_broken'] as bool
  );
  
  Map<String, dynamic> toJson() => {
    'detect_id': detectId,
    'is_broken': isBroken
  };

  RespSyncDetect clone() => RespSyncDetect(
    detectId: detectId,
    isBroken: isBroken
  );


  RespSyncDetect copyWith({
    String? detectId,
    bool? isBroken
  }) => RespSyncDetect(
    detectId: detectId ?? this.detectId,
    isBroken: isBroken ?? this.isBroken,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RespSyncDetect && detectId == other.detectId && isBroken == other.isBroken;

  @override
  int get hashCode => detectId.hashCode ^ isBroken.hashCode;
}
