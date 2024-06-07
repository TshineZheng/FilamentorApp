import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class RespSyncController {

  const RespSyncController({
    required this.controllerId,
    required this.channelStates,
  });

  final String controllerId;
  final List<int> channelStates;

  factory RespSyncController.fromJson(Map<String,dynamic> json) => RespSyncController(
    controllerId: json['controller_id'].toString(),
    channelStates: (json['channel_states'] as List? ?? []).map((e) => e as int).toList()
  );
  
  Map<String, dynamic> toJson() => {
    'controller_id': controllerId,
    'channel_states': channelStates.map((e) => e.toString()).toList()
  };

  RespSyncController clone() => RespSyncController(
    controllerId: controllerId,
    channelStates: channelStates.toList()
  );


  RespSyncController copyWith({
    String? controllerId,
    List<int>? channelStates
  }) => RespSyncController(
    controllerId: controllerId ?? this.controllerId,
    channelStates: channelStates ?? this.channelStates,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RespSyncController && controllerId == other.controllerId && channelStates == other.channelStates;

  @override
  int get hashCode => controllerId.hashCode ^ channelStates.hashCode;
}
