import 'package:dio/dio.dart' hide Headers;
import 'package:front/core/utils/api_response.dart';
import 'package:front/features/project/data/models/change_project_state.dart';
import 'package:front/features/project/data/models/create_project_request.dart';
import 'package:front/features/project/data/models/project_member.dart';
import 'package:front/features/project/data/models/project_model.dart';
import 'package:retrofit/http.dart';

part 'project_api.g.dart';

@RestApi()
abstract class ProjectAPI {
  factory ProjectAPI(Dio dio, {String baseUrl}) = _ProjectAPI;

//프로젝트 생성

  @POST('/team/{teamId}/project')
  @Headers({'accessToken': 'true'})
  Future<ApiResponse<ProjectModel>> createProejcet({
    @Path('teamId') required int teamId,
    @Body() required CreateProjectRequest createProjectRequest,
  });

//프로젝트 상세 조회 메서드
  @GET('/project/{projectId}')
  @Headers({'accessToken': 'true'})
  Future<ApiResponse<ProjectModel>> getProjectById({
    @Path('projectId') required int projectId,
  });

//프로젝트 삭제 메서드
  @DELETE('/project/{projectId}')
  @Headers({'accessToken': 'true'})
  Future<ApiResponse> deleteProjectById({
    @Path('projectId') required int projectId,
  });

  //프로젝트 수정 메서드
  @PATCH('/project/{projectId}')
  @Headers({'accessToken': 'true'})
  Future<ApiResponse<ProjectModel>> updateProjectById({
    @Path('projectId') required int projectId,
    @Body() required CreateProjectRequest projectRequest,
  });

  //프로젝트 상태 번경 메서드
  @PATCH('/project/{projectId}/state')
  @Headers({'accessToken': 'true'})
  Future<ApiResponse> changeProjectStateById({
    @Path('projectId') required int projectId,
    @Body() required ChangeProjectState changeProjectState,
  });

  //프로젝트 전체 조회 메서드
  @GET('/team/{teamId}/projects')
  @Headers({'accessToken': 'true'})
  Future<ApiResponse<List<ProjectModel>>> getProjectsByTeamId({
    @Path('teamId') required int teamId,
  });

  //프로젝트 멤버 전체 조회 메서드
  @GET('/project/{projectId}/members')
  @Headers({'accessToken': 'true'})
  Future<ApiResponse<List<ProjectMember>>> getProjectMembers({
    @Path('projectId') required int projectId,
  });
}
