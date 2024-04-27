import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_task_state.g.dart';

@JsonSerializable()
class UpdateTaskState {
  UpdateTaskState({
    required this.taskStateId,
    required this.taskId,
  });
  factory UpdateTaskState.fromJson(Map<String, dynamic> json) =>
      _$UpdateTaskStateFromJson(json);
  final int taskStateId;
  final int taskId;

  Map<String, dynamic> toJson() => _$UpdateTaskStateToJson(this);
}
