import 'package:dartz/dartz.dart';
import 'package:front/core/project/data/models/project_request.dart';
import 'package:front/core/project/domain/entities/project_entity.dart';
import 'package:front/core/project/domain/repositories/project_repository.dart';
import 'package:front/core/utils/failure.dart';

class UpdateProjectUseCase {
  const UpdateProjectUseCase(this.projectRepository);
  final ProjectRepository projectRepository;

  Future<Either<Failure, ProjectEntity>> call(
      ProjectRequestModel project, int projectId) {
    return projectRepository.updateProjectById(project, projectId);
  }
}
