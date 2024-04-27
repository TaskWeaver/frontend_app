import 'package:front/core/utils/api_response.dart';
import 'package:front/core/utils/result.dart';
import 'package:front/features/team/data/models/create_team_request.dart';
import 'package:front/features/team/data/models/create_team_response.dart';
import 'package:front/features/team/repositories/team_repository.dart';

final class CreateTeamUseCase {
  const CreateTeamUseCase(this._teamRepository);
  final TeamRepository _teamRepository;

  Future<Result<ApiResponse<CreateTeamResponse>>> call(
      {required CreateTeamRequest createTeamRequest}) async {
    return _teamRepository.createTeam(createTeamRequest);
  }
}
