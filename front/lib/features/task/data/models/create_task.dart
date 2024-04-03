// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_task.g.dart';

@JsonSerializable()
class CreateTask {
  final int taskId;
  final String projectId;
  final String taskStateId;
  final String title;
  final String content;
  final String deletedAt;
  final String color;
  final int imo;
  final String endDate;

  CreateTask({
    required this.taskId,
    required this.projectId,
    required this.taskStateId,
    required this.title,
    required this.content,
    required this.deletedAt,
    required this.color,
    required this.imo,
    required this.endDate,
  });

  factory CreateTask.fromJson(Map<String, dynamic> json) =>
      _$CreateTaskFromJson(json);

  Map<String, dynamic> toJson() => _$CreateTaskToJson(this);
}
