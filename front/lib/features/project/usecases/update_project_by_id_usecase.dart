import 'package:dartz/dartz.dart';
import 'package:front/core/utils/failure.dart';
import 'package:front/features/project/data/models/project_create_model.dart';
import 'package:front/features/project/entities/project_entity.dart';
import 'package:front/features/project/repositories/project_repository.dart';

class UpdateProjectUseCase {
  const UpdateProjectUseCase(this.projectRepository);
  final ProjectRepository projectRepository;

  Future<Either<Failure, Project>> call(
      Project project, int projectId) {
    return projectRepository.updateProjectById(project, projectId);
  }
}
