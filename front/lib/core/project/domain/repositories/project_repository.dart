import 'package:dartz/dartz.dart';
import 'package:front/core/project/data/models/project_request.dart';
import 'package:front/core/project/domain/entities/project.dart';
import 'package:front/core/utils/failure.dart';

abstract class ProjectRepository {
  Future<Either<Failure, List<Project>>> getProjectsByTeamId(int teamId);
  Future<Either<Failure, Project>> getProjectById(int projectId);
  Future<Either<Failure, Project>> updateProjectById(
      ProjectRequestModel project, int projectId);
  Future<Either<Failure, Project>> createProject(
      ProjectRequestModel project, int teamId);
  Future<Either<Failure, void>> deleteProjectById(int projectId);
}
