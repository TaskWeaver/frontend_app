import 'package:dartz/dartz.dart';
import 'package:front/core/project/domain/entities/project_entity.dart';
import 'package:front/core/project/domain/repositories/project_repository.dart';
import 'package:front/core/utils/failure.dart';

class GetProjectsByTeamIdUseCase {
  const GetProjectsByTeamIdUseCase(this.projectRepository);
  final ProjectRepository projectRepository;

  Future<Either<Failure, List<ProjectEntity>>> call(int teamId) {
    return projectRepository.getProjectsByTeamId(teamId);
  }
}
