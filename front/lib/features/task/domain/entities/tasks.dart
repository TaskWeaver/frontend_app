import 'package:equatable/equatable.dart';
import 'package:front/features/task/domain/entities/task.dart';

class TasksEntity extends Equatable {
  const TasksEntity({required this.values});

  final List<TaskEntity> values;

  @override
  List<Object?> get props => [values];
}
