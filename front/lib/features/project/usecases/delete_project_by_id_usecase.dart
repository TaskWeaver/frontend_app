import 'package:dartz/dartz.dart';

import 'package:front/core/utils/failure.dart';
import 'package:front/features/project/repositories/project_repository.dart';

class DeleteProjectByIdUseCase {
  const DeleteProjectByIdUseCase(this.projectRepository);
  final ProjectRepository projectRepository;

  Future<Either<Failure, void>> call(int teamId) {
    return projectRepository.deleteProjectById(teamId);
  }
}
