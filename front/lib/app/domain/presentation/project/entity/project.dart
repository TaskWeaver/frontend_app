import 'package:front/app/domain/presentation/project/entity/task.dart';

class Project {
  Project({
    required this.projectTitle,
    required this.projectContent,
    required this.assignee,
    required this.startDate,
    this.tasks = const [],
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
        projectTitle: json['projectTitle'],
        projectContent: json['projectContent'],
        assignee: json['assignee'],
        tasks: json['tasks'] != null
            ? (json['tasks'] as List).map((i) => Task.fromJson(i)).toList()
            : [],
        startDate: DateTime.parse(json['startDate']));
  }
  final String projectTitle;
  final String projectContent;
  final String assignee;
  final List<Task> tasks;
  final DateTime startDate;

  Map<String, dynamic> toJson() {
    return {
      'projectTitle': projectTitle,
      'projectContent': projectContent,
      'assignee': assignee,
      'tasks': tasks.map((task) => task.toJson()).toList(),
      'startDate': startDate.toIso8601String(),
    };
  }
}
