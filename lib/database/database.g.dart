// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $AllTasksTable extends AllTasks with TableInfo<$AllTasksTable, AllTask> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AllTasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<String> time = GeneratedColumn<String>(
      'time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _currentTimeMeta =
      const VerificationMeta('currentTime');
  @override
  late final GeneratedColumn<String> currentTime = GeneratedColumn<String>(
      'currentTime', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isTaskCompletedMeta =
      const VerificationMeta('isTaskCompleted');
  @override
  late final GeneratedColumn<bool> isTaskCompleted =
      GeneratedColumn<bool>('is_task_completed', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_task_completed" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _isTaskPausedMeta =
      const VerificationMeta('isTaskPaused');
  @override
  late final GeneratedColumn<bool> isTaskPaused =
      GeneratedColumn<bool>('is_task_paused', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_task_paused" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        description,
        time,
        currentTime,
        isTaskCompleted,
        isTaskPaused
      ];
  @override
  String get aliasedName => _alias ?? 'all_tasks';
  @override
  String get actualTableName => 'all_tasks';
  @override
  VerificationContext validateIntegrity(Insertable<AllTask> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    if (data.containsKey('currentTime')) {
      context.handle(
          _currentTimeMeta,
          currentTime.isAcceptableOrUnknown(
              data['currentTime']!, _currentTimeMeta));
    } else if (isInserting) {
      context.missing(_currentTimeMeta);
    }
    if (data.containsKey('is_task_completed')) {
      context.handle(
          _isTaskCompletedMeta,
          isTaskCompleted.isAcceptableOrUnknown(
              data['is_task_completed']!, _isTaskCompletedMeta));
    } else if (isInserting) {
      context.missing(_isTaskCompletedMeta);
    }
    if (data.containsKey('is_task_paused')) {
      context.handle(
          _isTaskPausedMeta,
          isTaskPaused.isAcceptableOrUnknown(
              data['is_task_paused']!, _isTaskPausedMeta));
    } else if (isInserting) {
      context.missing(_isTaskPausedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AllTask map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AllTask(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      time: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}time'])!,
      currentTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currentTime'])!,
      isTaskCompleted: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}is_task_completed'])!,
      isTaskPaused: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_task_paused'])!,
    );
  }

  @override
  $AllTasksTable createAlias(String alias) {
    return $AllTasksTable(attachedDatabase, alias);
  }
}

class AllTask extends DataClass implements Insertable<AllTask> {
  final int id;
  final String title;
  final String description;
  final String time;
  final String currentTime;
  final bool isTaskCompleted;
  final bool isTaskPaused;
  const AllTask(
      {required this.id,
      required this.title,
      required this.description,
      required this.time,
      required this.currentTime,
      required this.isTaskCompleted,
      required this.isTaskPaused});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['time'] = Variable<String>(time);
    map['currentTime'] = Variable<String>(currentTime);
    map['is_task_completed'] = Variable<bool>(isTaskCompleted);
    map['is_task_paused'] = Variable<bool>(isTaskPaused);
    return map;
  }

  AllTasksCompanion toCompanion(bool nullToAbsent) {
    return AllTasksCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      time: Value(time),
      currentTime: Value(currentTime),
      isTaskCompleted: Value(isTaskCompleted),
      isTaskPaused: Value(isTaskPaused),
    );
  }

  factory AllTask.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AllTask(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      time: serializer.fromJson<String>(json['time']),
      currentTime: serializer.fromJson<String>(json['currentTime']),
      isTaskCompleted: serializer.fromJson<bool>(json['isTaskCompleted']),
      isTaskPaused: serializer.fromJson<bool>(json['isTaskPaused']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'time': serializer.toJson<String>(time),
      'currentTime': serializer.toJson<String>(currentTime),
      'isTaskCompleted': serializer.toJson<bool>(isTaskCompleted),
      'isTaskPaused': serializer.toJson<bool>(isTaskPaused),
    };
  }

  AllTask copyWith(
          {int? id,
          String? title,
          String? description,
          String? time,
          String? currentTime,
          bool? isTaskCompleted,
          bool? isTaskPaused}) =>
      AllTask(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        time: time ?? this.time,
        currentTime: currentTime ?? this.currentTime,
        isTaskCompleted: isTaskCompleted ?? this.isTaskCompleted,
        isTaskPaused: isTaskPaused ?? this.isTaskPaused,
      );
  @override
  String toString() {
    return (StringBuffer('AllTask(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('time: $time, ')
          ..write('currentTime: $currentTime, ')
          ..write('isTaskCompleted: $isTaskCompleted, ')
          ..write('isTaskPaused: $isTaskPaused')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, title, description, time, currentTime, isTaskCompleted, isTaskPaused);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AllTask &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.time == this.time &&
          other.currentTime == this.currentTime &&
          other.isTaskCompleted == this.isTaskCompleted &&
          other.isTaskPaused == this.isTaskPaused);
}

class AllTasksCompanion extends UpdateCompanion<AllTask> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<String> time;
  final Value<String> currentTime;
  final Value<bool> isTaskCompleted;
  final Value<bool> isTaskPaused;
  const AllTasksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.time = const Value.absent(),
    this.currentTime = const Value.absent(),
    this.isTaskCompleted = const Value.absent(),
    this.isTaskPaused = const Value.absent(),
  });
  AllTasksCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    required String time,
    required String currentTime,
    required bool isTaskCompleted,
    required bool isTaskPaused,
  })  : title = Value(title),
        description = Value(description),
        time = Value(time),
        currentTime = Value(currentTime),
        isTaskCompleted = Value(isTaskCompleted),
        isTaskPaused = Value(isTaskPaused);
  static Insertable<AllTask> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? time,
    Expression<String>? currentTime,
    Expression<bool>? isTaskCompleted,
    Expression<bool>? isTaskPaused,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (time != null) 'time': time,
      if (currentTime != null) 'currentTime': currentTime,
      if (isTaskCompleted != null) 'is_task_completed': isTaskCompleted,
      if (isTaskPaused != null) 'is_task_paused': isTaskPaused,
    });
  }

  AllTasksCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? description,
      Value<String>? time,
      Value<String>? currentTime,
      Value<bool>? isTaskCompleted,
      Value<bool>? isTaskPaused}) {
    return AllTasksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      time: time ?? this.time,
      currentTime: currentTime ?? this.currentTime,
      isTaskCompleted: isTaskCompleted ?? this.isTaskCompleted,
      isTaskPaused: isTaskPaused ?? this.isTaskPaused,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (time.present) {
      map['time'] = Variable<String>(time.value);
    }
    if (currentTime.present) {
      map['currentTime'] = Variable<String>(currentTime.value);
    }
    if (isTaskCompleted.present) {
      map['is_task_completed'] = Variable<bool>(isTaskCompleted.value);
    }
    if (isTaskPaused.present) {
      map['is_task_paused'] = Variable<bool>(isTaskPaused.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AllTasksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('time: $time, ')
          ..write('currentTime: $currentTime, ')
          ..write('isTaskCompleted: $isTaskCompleted, ')
          ..write('isTaskPaused: $isTaskPaused')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDataBase extends GeneratedDatabase {
  _$AppDataBase(QueryExecutor e) : super(e);
  late final $AllTasksTable allTasks = $AllTasksTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [allTasks];
}
