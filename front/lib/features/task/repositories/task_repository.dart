import 'package:front/core/utils/api_response.dart';
import 'package:front/core/utils/result.dart';
import 'package:front/features/task/data/models/create_task.dart';
import 'package:front/features/task/data/models/task.dart';
import 'package:front/features/task/data/models/update_task.dart';
import 'package:front/features/task/data/models/update_task_state.dart';

abstract class TaskRepository {
  Future<Result<ApiResponse<TaskModel>>> createTask(CreateTask createTask);
  Future<Result<ApiResponse<List<TaskModel>>>> getTasksByProject(int projectId);
  Future<Result<ApiResponse>> deleteTask(int taskId);
  Future<Result<ApiResponse<TaskModel>>> updateTask(UpdateTask updateTask);
  Future<Result<ApiResponse<TaskModel>>> updateTaskState(
      UpdateTaskState updateTaskState);
}
