import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front/features/project/entities/project.dart';

part 'project_create_model.g.dart';

@JsonSerializable()
class ProjectCreateModel extends Equatable {
  const ProjectCreateModel({
    required this.name,
    required this.description,
    required this.managerId,
    required this.members,
  });

  factory ProjectCreateModel.fromEntity(Project project) {
    return ProjectCreateModel(
      name: project.name,
      description: project.description,
      managerId: project.managerId,
      members: project.members!,
    );
  }

  final int managerId;
  final String name;
  final String description;
  final List<int> members;

  @override
  List<Object?> get props => [managerId, name, description];

  factory ProjectCreateModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectCreateModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectCreateModelToJson(this);
}
