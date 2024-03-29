import 'package:dio/dio.dart' hide Headers;
import 'package:front/features/team/data/models/invite_response.dart';
import 'package:front/features/team/data/models/invite_team.dart';
import 'package:front/features/team/data/models/team.dart';
import 'package:front/features/team/data/models/team_detail.dart';
import 'package:front/core/utils/api_response.dart';
import 'package:retrofit/http.dart';

part 'team_api.g.dart';

@RestApi()
abstract class TeamAPI {
  factory TeamAPI(Dio dio, {String baseUrl}) = _TeamAPI;

  @GET('/teams')
  @Headers({'accessToken': 'true'})
  Future<ApiResponse<List<TeamModel>>> getTeams();

  @POST('/team')
  @Headers({'accessToken': 'true'})
  Future<ApiResponse<TeamModel>> createTeam({
    @Body() required Map<String, dynamic> name,
  });

  @GET('/team/{teamId}')
  Future<ApiResponse<TeamDetailModel>> getTeamById({
    @Path() required int teamId,
  });

  @POST('/team/invitation/email')
  @Headers({'accessToken': 'true'})
  Future<ApiResponse> inviteTeamByEmail(
    @Body() InviteTeam inviteTeam,
  );

  @POST('/team/{teamId}/delete')
  @Headers({'accessToken': 'true'})
  Future<ApiResponse> deleteTeamMember({
    @Path() required int teamId,
    @Body() required Map<String, dynamic> memberId,
  });

  @POST('/team/invitation/notification')
  @Headers({'accessToken': 'true'})
  Future<ApiResponse> invitationNotification();

  @POST('/team/invitation/answer')
  @Headers({'accessToken': 'true'})
  Future<ApiResponse> answerToInvitation(
    @Body() InviteResponse inviteResponse,
  );
}
