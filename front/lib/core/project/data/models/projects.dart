import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front/core/project/data/models/project.dart';
import 'package:front/core/project/domain/entities/projects.dart';

part 'projects.freezed.dart';
part 'projects.g.dart';

@freezed
class ProjectsModel with _$ProjectsModel {
  factory ProjectsModel({required List<ProjectModel> values}) = _ProjectsModel;
  
  factory ProjectsModel.fromJson(Map<String, dynamic> json) => _$ProjectsModelFromJson(json);

  const ProjectsModel._();

  Projects toEntity() => Projects(
      values: values.map((projectModel) => projectModel.toEntity()).toList());
}
