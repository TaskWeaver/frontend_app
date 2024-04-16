import 'package:dartz/dartz.dart';
import 'package:front/core/utils/failure.dart';
import 'package:front/features/project/entities/project_entity.dart';
import 'package:front/features/project/repositories/project_repository.dart';

class GetProjectsByTeamIdUseCase {
  const GetProjectsByTeamIdUseCase(this.projectRepository);
  final ProjectRepository projectRepository;

  Future<Either<Failure, List<Project>>> call(int teamId) {
    return projectRepository.getProjectsByTeamId(teamId);
  }
}
