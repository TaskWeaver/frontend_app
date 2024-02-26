import 'package:dartz/dartz.dart';
import 'package:front/core/project/data/models/project_create.dart';
import 'package:front/core/project/domain/entities/project.dart';
import 'package:front/core/utils/failure.dart';

abstract class ProjectRepository {
  Future<Either<Failure, List<Project>>> getProjectsByTeamId(int teamId);
  Future<Either<Failure, Project>> getProjectById(int projectId);
  Future<Either<Failure, Project>> updateProject(ProjectRequestModel project, int projectId);
  Future<Either<Failure, String>> deleteProjectById(String projectId);
  Future<Either<Failure, Project>> createProject(ProjectRequestModel project, int teamId);
}
