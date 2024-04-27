import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class TaskModel with _$TaskModel {
  factory TaskModel({
    required int taskId,
    required String projectId,
    required String projectStateId,
    required String taskStateId,
    int? parentTaskId,
    required String title,
    required String content,
    required String deletedAt,
    required String color,
    required int imo,
    required String createdAt,
    required String startDate,
    required String endDate,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  factory TaskModel.fromModel(TaskModel task) {
    return TaskModel(
      taskId: task.taskId,
      projectId: task.projectId,
      projectStateId: task.projectStateId,
      taskStateId: task.taskStateId,
      parentTaskId: task.parentTaskId,
      title: task.title,
      content: task.content,
      deletedAt: task.deletedAt,
      color: task.color,
      imo: task.imo,
      createdAt: task.createdAt,
      startDate: task.startDate,
      endDate: task.endDate,
    );
  }
}
