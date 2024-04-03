import 'package:front/core/utils/api_response.dart';
import 'package:front/core/utils/result.dart';
import 'package:front/features/task/data/data_source/task_remote_data_source.dart';
import 'package:front/features/task/data/models/create_task.dart';
import 'package:front/features/task/data/models/task.dart';
import 'package:front/features/task/data/models/update_task.dart';
import 'package:front/features/task/data/models/update_task_state.dart';
import 'package:front/features/task/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  const TaskRepositoryImpl({
    required TaskRemoteDataSource taskRemoteDataSource,
  }) : _taskRemoteDataSource = taskRemoteDataSource;

  final TaskRemoteDataSource _taskRemoteDataSource;

  @override
  Future<Result<ApiResponse<TaskModel>>> createTask(
      CreateTask createTask) async {
    try {
      var result = await _taskRemoteDataSource.createTask(createTask);

      return Result.success(result);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<ApiResponse>> deleteTask(int taskId) async {
    try {
      var result = await _taskRemoteDataSource.deleteTask(taskId);

      return Result.success(result);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<ApiResponse<List<TaskModel>>>> getTasksByProject(
      int projectId) async {
    try {
      var result = await _taskRemoteDataSource.getTasksByProject(projectId);

      return Result.success(result);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<ApiResponse<TaskModel>>> updateTask(
      UpdateTask updateTask) async {
    try {
      var result = await _taskRemoteDataSource.updateTask(updateTask);

      return Result.success(result);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<ApiResponse<TaskModel>>> updateTaskState(
      UpdateTaskState updateTaskState) async {
    try {
      var result = await _taskRemoteDataSource.updateTaskState(updateTaskState);

      return Result.success(result);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }
}
