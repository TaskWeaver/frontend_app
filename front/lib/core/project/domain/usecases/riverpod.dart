import 'package:front/core/project/data/repositories/riverpod.dart';
import 'package:front/core/project/domain/usecases/get_projects_by_team_id_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'riverpod.g.dart';

@riverpod
GetProjectsByTeamIdUseCase getProjectsByTeamIdUseCase(
    GetProjectsByTeamIdUseCaseRef ref) {
  var projectRepository = ref.read(projectRepositoryProvider);
  return GetProjectsByTeamIdUseCase(projectRepository);
}
