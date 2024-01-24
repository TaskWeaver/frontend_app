import 'package:dartz/dartz.dart';
import 'package:front/core/project/domain/entities/projects.dart';
import 'package:front/core/project/domain/repositories/project_repository.dart';
import 'package:front/core/utils/failure.dart';

class GetProjectsByTeamIdUseCase {
  const GetProjectsByTeamIdUseCase(this.teamRepository);
  final ProjectRepository teamRepository;

  Future<Either<Failure, Projects>> execute(String teamId) {
    return teamRepository.getProjectsByTeamId(teamId);
  }
}