
import 'package:equatable/equatable.dart';
import 'package:front/core/project/domain/entities/project.dart';

class ProjectsEntity extends Equatable {
  const ProjectsEntity({required this.values});

  final List<ProjectEntity> values;

  @override
  List<Object?> get props => [values];
}
