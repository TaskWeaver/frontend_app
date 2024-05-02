// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front/core/const/enum.dart';
import 'package:front/features/project/entities/project_entity.dart';

part 'project_model.g.dart';

@JsonSerializable()
class ProjectModel extends Equatable {
  const ProjectModel({
    required this.projectId,
    required this.name,
    required this.description,
    required this.managerId,
    required this.projectState,
    this.memberIdList,
  });

  factory ProjectModel.fromEntity(Project project) {
    return ProjectModel(
      projectId: project.projectId,
      managerId: project.managerId,
      name: project.name,
      description: project.description,
      projectState: project.projectState.code,
      memberIdList: project.memberIdList,
    );
  }

  final int projectId;
  final String name;
  final String description;
  final int managerId;
  final String projectState;
  final List<int>? memberIdList;

  Project toEntity() {
    return Project(
      projectId: projectId,
      managerId: managerId,
      name: name,
      description: description,
      projectState: ProjectStateEnum.getByCode(projectState),
      memberIdList: memberIdList,
    );
  }

  Map<String, dynamic> toJson() => _$ProjectModelToJson(this);
  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);

  @override
  List<Object?> get props =>
      [projectId, name, description, managerId, projectState, memberIdList];
}
