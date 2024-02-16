import 'package:front/core/project/data/repositories/riverpod.dart';
import 'package:front/core/project/domain/usecases/create_project_usecase.dart';
import 'package:front/core/project/domain/usecases/get_project_by_id_usecase.dart';
import 'package:front/core/project/domain/usecases/get_projects_by_team_id_usecase.dart';
import 'package:front/core/project/domain/usecases/update_project_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'riverpod.g.dart';

@riverpod
GetProjectsByTeamIdUseCase getProjectsByTeamIdUseCase(
    GetProjectsByTeamIdUseCaseRef ref) {
  var projectRepository = ref.read(projectRepositoryProvider);
  return GetProjectsByTeamIdUseCase(projectRepository);
}

@riverpod
GetProjectByIdUseCase getProjectByIdUseCase(GetProjectByIdUseCaseRef ref) {
  var projectRepository = ref.read(projectRepositoryProvider);
  return GetProjectByIdUseCase(projectRepository);
}

@riverpod
UpdateProjectUseCase updateProjectUseCase(UpdateProjectUseCaseRef ref) {
  var projectRepository = ref.read(projectRepositoryProvider);
  return UpdateProjectUseCase(projectRepository);
}

@riverpod
CreateProjectUseCase createProjectUseCase(CreateProjectUseCaseRef ref) {
  var projectRepository = ref.read(projectRepositoryProvider);
  return CreateProjectUseCase(projectRepository);
}
