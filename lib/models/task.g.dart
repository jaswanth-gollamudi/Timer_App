// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Task _$$_TaskFromJson(Map<String, dynamic> json) => _$_Task(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      timerState: $enumDecode(_$TimerStateEnumMap, json['timerState']),
      remainingDurationWhenLastActionHappened: Duration(
          microseconds: json['remainingDurationWhenLastActionHappened'] as int),
      lastActionHappened: DateTime.parse(json['lastActionHappened'] as String),
    );

Map<String, dynamic> _$$_TaskToJson(_$_Task instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'timerState': _$TimerStateEnumMap[instance.timerState]!,
      'remainingDurationWhenLastActionHappened':
          instance.remainingDurationWhenLastActionHappened.inMicroseconds,
      'lastActionHappened': instance.lastActionHappened.toIso8601String(),
    };

const _$TimerStateEnumMap = {
  TimerState.completed: 'completed',
  TimerState.paused: 'paused',
  TimerState.running: 'running',
};
