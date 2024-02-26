// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front/app/domain/presentation/project/state/project_state.dart';
import 'package:front/core/const/enum.dart';
import 'package:front/core/project/domain/entities/project.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class ProjectModel with _$ProjectModel {
  factory ProjectModel({
    required int projectId,
    required String name,
    required String description,
    required int managerId,
    required String projectState,
  }) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);

  factory ProjectModel.fromEntity(Project project) {
    return ProjectModel(
      projectId: project.projectId,
      managerId: project.managerId,
      name: project.name,
      description: project.description,
      projectState: project.projectState.code,
    );
  }

  ProjectModel._();

  Project toEntity() {
    return Project(
      projectId: projectId,
      managerId: managerId,
      name: name,
      description: description,
      projectState: ProjectStateEnum.getByCode(projectState),);
  }
}
