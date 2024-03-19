import 'package:dio/dio.dart' hide Headers;
import 'package:front/core/team/data/models/team.dart';
import 'package:front/core/team/domain/entities/team_entity.dart';
import 'package:retrofit/http.dart';

part 'team_api.g.dart';

@RestApi()
abstract class TeamAPI {
  factory TeamAPI(Dio dio, {String baseUrl}) = _TeamAPI;

  // @GET('/teams')
  // @Headers({'accessToken': 'true'})
  // Future<List<TeamEntity>> getTeams();

  @POST('/team')
  @Headers({'accessToken': 'true'})
  Future<TeamModel> createTeam({
    @Body() required Map<String, dynamic> name,
  });
}
