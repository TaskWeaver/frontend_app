// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front/core/const/enum.dart';
import 'package:front/features/project/entities/project.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class ProjectModel with _$ProjectModel {
  factory ProjectModel({
    required int projectId,
    required String name,
    required String description,
    required int managerId,
    List<int>? memberId, // 수정된 부분: memberId는 nullable이며 기본값이 null입니다.
    required String projectState,
    required DateTime createdAt,
  }) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);

  factory ProjectModel.fromEntity(Project project) {
    return ProjectModel(
      projectId: project.projectId,
      managerId: project.managerId,
      createdAt: project.createdAt,
      memberId: project.memberId,
      name: project.name,
      description: project.description,
      projectState: project.projectState.code,
    );
  }

  ProjectModel._();

  Project toEntity() {
    return Project(
      createdAt: createdAt,
      memberId: memberId,
      projectId: projectId,
      managerId: managerId,
      name: name,
      description: description,
      projectState: ProjectStateEnum.getByCode(projectState),
    );
  }
}
