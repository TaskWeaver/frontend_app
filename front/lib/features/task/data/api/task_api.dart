import 'package:dio/dio.dart' hide Headers;
import 'package:front/core/utils/api_response.dart';
import 'package:front/features/task/data/models/create_task.dart';
import 'package:front/features/task/data/models/task.dart';
import 'package:front/features/task/data/models/update_task.dart';
import 'package:front/features/task/data/models/update_task_state.dart';
import 'package:retrofit/http.dart';

part 'task_api.g.dart';

@RestApi()
abstract class TaskAPI {
  factory TaskAPI(Dio dio, {String baseUrl}) = _TaskAPI;

//태스크 생성
  @POST('/projects/{projectId}/tasks')
  @Headers({'accessToken': 'true'})
  Future<ApiResponse<TaskModel>> createTask({
    @Body() required CreateTask createTask,
  });

//프로젝트에 해당하는 모든 테스크 가져오기
  @GET('/projects/{projectId}/tasks')
  Future<ApiResponse<List<TaskModel>>> getTasksByProject({
    @Path() required int projectId,
  });

  @DELETE('/task/{taskId}')
  @Headers({'accessToken': 'true'})
  Future<ApiResponse> deleteTask({
    @Path() required int taskId,
  });

  @PATCH('/task/{taskId}')
  @Headers({'accessToken': 'true'})
  Future<ApiResponse<TaskModel>> updateTask({
    @Path() required int taskId,
    @Body() required UpdateTask updateTask,
  });

  @PATCH('/task/state/{taskId}')
  @Headers({'accessToken': 'true'})
  Future<ApiResponse<TaskModel>> updateTaskState({
    @Path() required int taskId,
    @Body() required UpdateTaskState updateTaskState,
  });
}
