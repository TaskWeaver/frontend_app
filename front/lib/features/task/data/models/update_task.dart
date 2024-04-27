// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_task.g.dart';

@JsonSerializable()
class UpdateTask {
  final int taskId;
  final String projectId;
  final String taskStateId;
  final String title;
  final String content;
  final String deletedAt;
  final String color;
  final int imo;
  final String endDate;

  UpdateTask({
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

  factory UpdateTask.fromJson(Map<String, dynamic> json) =>
      _$UpdateTaskFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateTaskToJson(this);
}
