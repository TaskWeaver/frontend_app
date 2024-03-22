import 'package:dio/dio.dart' hide Headers;
import 'package:front/core/team/data/models/team.dart';
import 'package:front/core/team/data/models/team_detail.dart';
import 'package:front/core/utils/api_response.dart';
import 'package:retrofit/http.dart';

part 'team_api.g.dart';

@RestApi()
abstract class TeamAPI {
  factory TeamAPI(Dio dio, {String baseUrl}) = _TeamAPI;

  @GET('/teams')
  @Headers({'accessToken': 'true'})
  Future<List<TeamModel>> getTeams();

  // TODO: Body 모델 타입으로 받기
  @POST('/team')
  @Headers({'accessToken': 'true'})
  Future<TeamModel> createTeam({
    @Body() required Map<String, dynamic> name,
  });

  @GET('/team/{teamId}')
  Future<ApiResponse<TeamDetailModel>> getTeamById({
    @Path() required int teamId,
  });

  // TODO: Body 모델 타입으로 받기
  @POST('/team/invitation/email')
  @Headers({'accessToken': 'true'})
  Future inviteTeamByEmail({
    @Body() required Map<String, dynamic> invite,
  });

  // TODO: Body 모델 타입으로 받기
  @POST('/team/{teamId}/delete')
  @Headers({'accessToken': 'true'})
  Future deleteMember({
    @Path() required int teamId,
    @Body() required Map<String, dynamic> memberId,
  });

  @POST('/team/invitation/notification')
  @Headers({'accessToken': 'true'})
  Future invitationNotification();

  @POST('/team/invitation/answer')
  @Headers({'accessToken': 'true'})
  Future invitationAnswer({
    @Body() required Map<String, dynamic> invitation,
  });

}
