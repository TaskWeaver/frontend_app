import 'package:dartz/dartz.dart';

import 'package:front/core/utils/failure.dart';
import 'package:front/features/project/entities/project_entity.dart';
import 'package:front/features/project/repositories/project_repository.dart';

class GetProjectByIdUseCase {
  const GetProjectByIdUseCase(this.projectRepository);
  final ProjectRepository projectRepository;

  Future<Either<Failure, Project>> call(int teamId) {
    return projectRepository.getProjectById(teamId);
  }
}
