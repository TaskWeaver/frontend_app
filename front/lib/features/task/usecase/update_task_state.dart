import 'package:front/core/utils/api_response.dart';
import 'package:front/core/utils/result.dart';
import 'package:front/features/task/data/models/update_task_state.dart';
import 'package:front/features/task/repositories/task_repository.dart';

final class UpdateTaskStateUseCase {
  const UpdateTaskStateUseCase(this._taskRepository);
  final TaskRepository _taskRepository;

  Future<Result<ApiResponse>> call(
      {required UpdateTaskState updateTaskState}) async {
    return _taskRepository.updateTaskState(updateTaskState);
  }
}
