import 'package:front/core/utils/api_response.dart';
import 'package:front/core/utils/result.dart';
import 'package:front/features/project/data/models/project_model.dart';
import 'package:front/features/project/data/repositories/project_repositories.dart';

final class GetProjectsByTeamIdUseCase {
  const GetProjectsByTeamIdUseCase(this._projectRepository);
  final ProjectRepository _projectRepository;

  Future<Result<ApiResponse<List<ProjectModel>>>> call(int teamId) async {
    return _projectRepository.getProjectsByTeamId(teamId);
  }
}
