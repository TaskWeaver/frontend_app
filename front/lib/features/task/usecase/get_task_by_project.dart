import 'package:front/core/utils/api_response.dart';
import 'package:front/core/utils/result.dart';
import 'package:front/features/task/repositories/task_repository.dart';

final class GetTasksByProjectUseCase {
  const GetTasksByProjectUseCase(this._taskRepository);
  final TaskRepository _taskRepository;

  Future<Result<ApiResponse>> call({required int projectId}) async {
    return _taskRepository.getTasksByProject(projectId);
  }
}
