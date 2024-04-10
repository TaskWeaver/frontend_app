import 'package:equatable/equatable.dart';
import 'package:front/features/project/entities/project.dart';

class ProjectRequestModel extends Equatable {
  const ProjectRequestModel({
    required this.name,
    required this.description,
    required this.managerId,
  });

  factory ProjectRequestModel.fromJson(Map<String, dynamic> json) {
    return ProjectRequestModel(
      name: json['name'],
      description: json['description'],
      managerId: json['managerId'],
    );
  }

  factory ProjectRequestModel.fromEntity(Project project) {
    return ProjectRequestModel(
      name: project.name,
      description: project.description,
      managerId: project.managerId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'managerId': managerId,
    };
  }

  final int managerId;
  final String name;
  final String description;

  @override
  List<Object?> get props => [managerId, name, description];
}
