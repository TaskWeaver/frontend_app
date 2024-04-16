import 'package:dartz/dartz.dart';
import 'package:front/core/utils/failure.dart';
import 'package:front/features/project/data/models/project_create_model.dart';
import 'package:front/features/project/entities/project_entity.dart';

abstract class ProjectRepository {
  Future<Either<Failure, List<Project>>> getProjectsByTeamId(int teamId);
  Future<Either<Failure, Project>> getProjectById(int projectId);
  Future<Either<Failure, Project>> updateProjectById(
      Project project, int projectId);
  Future<Either<Failure, Project>> createProject(
      ProjectCreateModel project, int teamId);
  Future<Either<Failure, void>> deleteProjectById(int projectId);
}
