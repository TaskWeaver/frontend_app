import 'package:front/core/utils/api_response.dart';
import 'package:front/features/task/data/models/create_task.dart';
import 'package:front/features/task/data/models/task.dart';
import 'package:front/features/task/data/models/update_task.dart';
import 'package:front/features/task/data/models/update_task_state.dart';

abstract class TaskRemoteDataSource {
  Future<ApiResponse<TaskModel>> createTask(CreateTask createTask);
  Future<ApiResponse<List<TaskModel>>> getTasksByProject(int projectId);
  Future<ApiResponse> deleteTask(int taskId);
  Future<ApiResponse<TaskModel>> updateTask(UpdateTask updateTask);
  Future<ApiResponse<TaskModel>> updateTaskState(
      UpdateTaskState updateTaskState);
}
