import 'package:dartz/dartz.dart';
import 'package:front/core/project/domain/entities/project.dart';
import 'package:front/core/project/domain/entities/projects.dart';
import 'package:front/core/utils/failure.dart';

abstract class ProjectRepository {
  Future<Either<Failure, Projects>> getProjectsByTeamId(String teamId);
  Future<Either<Failure, Project>> getProjectById(String projectId);
}
