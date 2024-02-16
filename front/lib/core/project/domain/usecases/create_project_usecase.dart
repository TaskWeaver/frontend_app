import 'package:dartz/dartz.dart';
import 'package:front/core/project/data/models/project_create.dart';
import 'package:front/core/project/domain/entities/project.dart';
import 'package:front/core/project/domain/repositories/project_repository.dart';
import 'package:front/core/utils/failure.dart';

class CreateProjectUseCase {
  const CreateProjectUseCase(this.projectRepository);
  final ProjectRepository projectRepository;

  Future<Either<Failure, Project>> call(ProjectCreateModel project) {
    return projectRepository.createProject(project);
  }
}