import 'package:front/core/utils/api_response.dart';
import 'package:front/core/utils/result.dart';
import 'package:front/features/team/data/models/team_detail_model.dart';
import 'package:front/features/team/repositories/team_repository.dart';

final class GetTeamByIdUseCase {
  const GetTeamByIdUseCase(this._teamRepository);

  final TeamRepository _teamRepository;

  Future<Result<ApiResponse<TeamDetailModel>>> call(
      {required int teamId}) async {
    return _teamRepository.getTeamById(teamId);
  }
}
