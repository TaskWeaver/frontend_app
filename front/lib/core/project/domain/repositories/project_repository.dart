import 'package:dartz/dartz.dart';
import 'package:front/core/project/data/models/project_create.dart';
import 'package:front/core/project/domain/entities/project.dart';
import 'package:front/core/utils/failure.dart';

abstract class ProjectRepository {
  Future<Either<Failure, List<Project>>> getProjectsByTeamId(String teamId);
  Future<Either<Failure, Project>> getProjectById(String projectId);
  Future<Either<Failure, Project>> updateProject(Project project);
  Future<Either<Failure, String>> deleteProjectById(String projectId);
  Future<Either<Failure, Project>> createProject(ProjectCreateModel project);
}
