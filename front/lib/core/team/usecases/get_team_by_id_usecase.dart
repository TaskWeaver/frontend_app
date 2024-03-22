import 'package:front/core/team/data/models/team_detail.dart';
import 'package:front/core/team/repositories/team_repository.dart';
import 'package:front/core/utils/api_response.dart';
import 'package:front/core/utils/result.dart';

final class GetTeamByIdUseCase {
  const GetTeamByIdUseCase(this._teamRepository);

  final TeamRepository _teamRepository;

  Future<Result<ApiResponse<TeamDetailModel>>> call({required int teamId}) async {
    return _teamRepository.getTeamById(teamId);
  }
}
