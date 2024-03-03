import 'package:dartz/dartz.dart';
import 'package:front/core/project/domain/entities/project.dart';
import 'package:front/core/project/domain/repositories/project_repository.dart';
import 'package:front/core/utils/failure.dart';

class GetProjectByIdUseCase {
  const GetProjectByIdUseCase(this.projectRepository);
  final ProjectRepository projectRepository;

  Future<Either<Failure, Project>> call(int teamId) {
    return projectRepository.getProjectById(teamId);
  }
}