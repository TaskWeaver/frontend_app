import 'package:front/core/network_handling/app_dio.dart';
import 'package:front/core/utils/api_response.dart';
import 'package:front/features/task/data/api/task_api.dart';
import 'package:front/features/task/data/data_source/task_remote_data_source.dart';
import 'package:front/features/task/data/models/create_task.dart';
import 'package:front/features/task/data/models/task.dart';
import 'package:front/features/task/data/models/update_task.dart';
import 'package:front/features/task/data/models/update_task_state.dart';

final class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  final TaskAPI _taskAPI = TaskAPI(
    AppDio.instance,
    baseUrl:
        'http://ec2-3-34-95-39.ap-northeast-2.compute.amazonaws.com:8083/v1',
  );

  @override
  Future<ApiResponse<TaskModel>> createTask(CreateTask createTask) {
    return _taskAPI.createTask(createTask: createTask);
  }

  @override
  Future<ApiResponse> deleteTask(int taskId) {
    return _taskAPI.deleteTask(taskId: taskId);
  }

  @override
  Future<ApiResponse<List<TaskModel>>> getTasksByProject(int projectId) {
    return _taskAPI.getTasksByProject(projectId: projectId);
  }

  @override
  Future<ApiResponse<TaskModel>> updateTask(UpdateTask updateTask) {
    return _taskAPI.updateTask(
        taskId: updateTask.taskId, updateTask: updateTask);
  }

  @override
  Future<ApiResponse<TaskModel>> updateTaskState(
      UpdateTaskState updateTaskState) {
    return _taskAPI.updateTaskState(
        taskId: updateTaskState.taskId, updateTaskState: updateTaskState);
  }
}
