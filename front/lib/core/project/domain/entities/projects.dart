
import 'package:equatable/equatable.dart';
import 'package:front/core/project/domain/entities/project.dart';

class Projects extends Equatable {
  const Projects({required this.values});

  final List<Project> values;

  @override
  List<Object?> get props => [values];
}
