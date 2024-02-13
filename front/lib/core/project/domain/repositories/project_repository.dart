import 'package:dartz/dartz.dart';
import 'package:front/core/project/domain/entities/project.dart';
import 'package:front/core/utils/failure.dart';

abstract class ProjectRepository {
  Future<Either<Failure, List<Project>>> getProjectsByTeamId(String teamId);
  Future<Either<Failure, Project>> getProjectById(String projectId);
}
