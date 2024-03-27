import 'package:dartz/dartz.dart';
import 'package:front/core/project/data/models/project_request.dart';
import 'package:front/core/project/domain/entities/project_entity.dart';
import 'package:front/core/utils/failure.dart';

abstract class ProjectRepository {
  Future<Either<Failure, List<ProjectEntity>>> getProjectsByTeamId(int teamId);
  Future<Either<Failure, ProjectEntity>> getProjectById(int projectId);
  Future<Either<Failure, ProjectEntity>> updateProjectById(
      ProjectRequestModel project, int projectId);
  Future<Either<Failure, ProjectEntity>> createProject(
      ProjectRequestModel project, int teamId);
  Future<Either<Failure, void>> deleteProjectById(int projectId);
}
