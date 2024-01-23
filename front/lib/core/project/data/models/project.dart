import 'package:front/core/project/domain/entities/project.dart';

class ProjectModel extends ProjectEntity {
  const ProjectModel({
    required super.id,
    required super.title,
    required super.content,
    required super.assignee,
    required super.startDate,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
        id: json['id'],
        title: json['title'],
        content: json['content'],
        assignee: json['assignee'],
        startDate: DateTime.parse(json['startDate']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'assignee': assignee,
      'startDate': startDate.toIso8601String(),
    };
  }

  ProjectEntity toEntity() {
    return ProjectEntity(
        id: id,
        title: title,
        content: content,
        assignee: assignee,
        startDate: startDate);
  }
}
