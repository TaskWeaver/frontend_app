import 'package:front/features/team/data/models/change_teamLeader.dart';
import 'package:front/core/utils/api_response.dart';
import 'package:front/core/utils/result.dart';
import 'package:front/features/team/repositories/team_repository.dart';

final class ChangeTeamLeaderUseCase {
  const ChangeTeamLeaderUseCase(this._teamRepository);
  final TeamRepository _teamRepository;

  Future<Result<ApiResponse>> call({required ChangeTeamLeaderModel changeTeamLeaderModel}) async {
    return _teamRepository.changeTeamLeader(changeTeamLeaderModel);
  }
}
