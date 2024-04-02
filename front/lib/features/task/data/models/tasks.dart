import 'package:front/features/task/data/models/task.dart';
import 'package:front/features/task/domain/entities/task.dart';
import 'package:front/features/task/domain/entities/tasks.dart';

class TasksModel {
  factory TasksModel.fromJson(Map<String, dynamic> jsonData) {
    return TasksModel(
        values: jsonData['values']
            .map<TaskEntity>((e) => TaskModel.fromJson(e))
            .toList());
  }
  const TasksModel({required this.values});

  final List<TaskModel> values;

  static List<TasksModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((e) => TasksModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    return {'values': values.map((taskModel) => taskModel.toJson())};
  }

  TasksEntity toEntity() => TasksEntity(
      values: values.map((taskModel) => taskModel.toEntity()).toList());
}
