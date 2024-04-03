import 'package:front/core/utils/api_response.dart';
import 'package:front/core/utils/result.dart';
import 'package:front/features/task/repositories/task_repository.dart';

final class DeleteTaskUseCase {
  const DeleteTaskUseCase(this._taskRepository);
  final TaskRepository _taskRepository;

  Future<Result<ApiResponse>> call({required int taskId}) async {
    return _taskRepository.deleteTask(taskId);
  }
}
