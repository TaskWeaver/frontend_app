import 'package:front/features/project/data/repositories/riverpod.dart';
import 'package:front/features/project/usecases/create_project_usecase.dart';
import 'package:front/features/project/usecases/delete_project_by_id_usecase.dart';
import 'package:front/features/project/usecases/get_project_by_id_usecase.dart';
import 'package:front/features/project/usecases/get_projects_by_team_id_usecase.dart';
import 'package:front/features/project/usecases/update_project_by_id_usecase.dart';
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
UpdateProjectUseCase updateProjectByIdUseCase(UpdateProjectByIdUseCaseRef ref) {
  var projectRepository = ref.read(projectRepositoryProvider);
  return UpdateProjectUseCase(projectRepository);
}

@riverpod
CreateProjectUseCase createProjectUseCase(CreateProjectUseCaseRef ref) {
  var projectRepository = ref.read(projectRepositoryProvider);
  return CreateProjectUseCase(projectRepository);
}

@riverpod
DeleteProjectByIdUseCase deleteProjectByIdUseCase(
    DeleteProjectByIdUseCaseRef ref) {
  var projectRepository = ref.read(projectRepositoryProvider);
  return DeleteProjectByIdUseCase(projectRepository);
}
