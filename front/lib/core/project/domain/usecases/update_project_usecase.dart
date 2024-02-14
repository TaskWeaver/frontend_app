import 'package:dartz/dartz.dart';
import 'package:front/core/project/domain/entities/project.dart';
import 'package:front/core/project/domain/repositories/project_repository.dart';
import 'package:front/core/utils/failure.dart';

class UpdateProjectUseCase {
  const UpdateProjectUseCase(this.projectRepository);
  final ProjectRepository projectRepository;

  Future<Either<Failure, Project>> call(Project project) {
    return projectRepository.updateProject(project);
  }
}