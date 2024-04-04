import 'package:dartz/dartz.dart';
import 'package:front/core/utils/failure.dart';
import 'package:front/features/project/data/models/project_request.dart';
import 'package:front/features/project/entities/project.dart';
import 'package:front/features/project/repositories/project_repository.dart';

class UpdateProjectUseCase {
  const UpdateProjectUseCase(this.projectRepository);
  final ProjectRepository projectRepository;

  Future<Either<Failure, Project>> call(
      Project project, int projectId) {
    return projectRepository.updateProjectById(project, projectId);
  }
}
