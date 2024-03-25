import 'package:front/core/utils/api_response.dart';
import 'package:front/features/data/models/invite_team.dart';
import 'package:front/features/team/repositories/team_repository.dart';
import 'package:front/core/utils/result.dart';

final class InviteTeamByEmailUseCase {
  const InviteTeamByEmailUseCase(this._teamRepository);
  final TeamRepository _teamRepository;

  Future<Result<ApiResponse>> call({required InviteTeam inviteTeam}) async {
    return _teamRepository.inviteTeamByEmail(inviteTeam);
  }
}
