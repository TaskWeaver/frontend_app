import 'package:front/core/utils/api_response.dart';
import 'package:front/core/utils/result.dart';
import 'package:front/features/project/data/models/create_project_request.dart';
import 'package:front/features/project/data/models/project_model.dart';
import 'package:front/features/project/data/repositories/project_repositories.dart';

final class UpdateProjectByIdUseCase {
  const UpdateProjectByIdUseCase(this._projectRepository);
  final ProjectRepository _projectRepository;

  Future<Result<ApiResponse<ProjectModel>>> call(
      CreateProjectRequest project, int projectId) async {
    return _projectRepository.updateProjectById(project, projectId);
  }
}
