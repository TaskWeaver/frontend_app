import 'package:dartz/dartz.dart';

import 'package:front/core/utils/failure.dart';
import 'package:front/features/project/data/models/project_request_model.dart';
import 'package:front/features/project/entities/project.dart';
import 'package:front/features/project/repositories/project_repository.dart';

class CreateProjectUseCase {
  const CreateProjectUseCase(this.projectRepository);
  final ProjectRepository projectRepository;

  Future<Either<Failure, Project>> call(
      ProjectRequestModel project, int teamId) {
    return projectRepository.createProject(project, teamId);
  }
}
