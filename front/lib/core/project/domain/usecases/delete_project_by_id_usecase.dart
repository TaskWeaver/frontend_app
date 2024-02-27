import 'package:dartz/dartz.dart';
import 'package:front/core/project/domain/repositories/project_repository.dart';
import 'package:front/core/utils/failure.dart';

class DeleteProjectByIdUseCase {
  const DeleteProjectByIdUseCase(this.projectRepository);
  final ProjectRepository projectRepository;

  Future<Either<Failure, void>> call(int teamId) {
    return projectRepository.deleteProjectById(teamId);
  }
}