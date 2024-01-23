import 'package:front/core/project/data/models/project.dart';
import 'package:front/core/project/domain/entities/project.dart';
import 'package:front/core/project/domain/entities/projects.dart';

class ProjectsModel {
  factory ProjectsModel.fromJson(Map<String, dynamic> jsonData) {
    return ProjectsModel(
        values: jsonData['values']
            .map<ProjectEntity>((e) => ProjectModel.fromJson(e))
            .toList());
  }
  const ProjectsModel({required this.values});

  final List<ProjectModel> values;

  static List<ProjectsModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((e) => ProjectsModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    return {'values': values.map((projectModel) => projectModel.toJson())};
  }

  ProjectsEntity toEntity() => ProjectsEntity(
      values: values.map((projectModel) => projectModel.toEntity()).toList());
}
