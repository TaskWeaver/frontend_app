import 'package:front/core/utils/api_response.dart';
import 'package:front/core/utils/result.dart';
import 'package:front/features/task/data/models/create_task.dart';
import 'package:front/features/task/data/models/task.dart';
import 'package:front/features/task/repositories/task_repository.dart';

final class CreateTaskUseCase {
  const CreateTaskUseCase(this._taskRepository);
  final TaskRepository _taskRepository;

  Future<Result<ApiResponse<TaskModel>>> call(
      {required CreateTask createTask}) async {
    return _taskRepository.createTask(createTask);
  }
}
