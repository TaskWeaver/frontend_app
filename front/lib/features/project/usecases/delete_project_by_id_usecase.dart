import 'package:front/core/utils/api_response.dart';
import 'package:front/core/utils/result.dart';
import 'package:front/features/project/data/repositories/project_repositories.dart';

final class DeleteProjectByIdUseCase {
  const DeleteProjectByIdUseCase(this._projectRepository);
  final ProjectRepository _projectRepository;

  Future<Result<ApiResponse>> call(int projectId) async {
    return _projectRepository.deleteProjectById(projectId);
  }
}
