import 'package:json_annotation/json_annotation.dart';

part 'change_project_state.g.dart';

@JsonSerializable()
class ChangeProjectState {
  ChangeProjectState({required this.projectState});

  factory ChangeProjectState.fromJson(Map<String, dynamic> json) =>
      _$ChangeProjectStateFromJson(json);
  final String projectState;
  Map<String, dynamic> toJson() => _$ChangeProjectStateToJson(this);
}
