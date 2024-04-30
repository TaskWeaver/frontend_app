import 'package:front/core/utils/result.dart';
import 'package:front/features/team/data/models/team_member.dart';
import 'package:front/features/team/repositories/team_repository.dart';

final class GetTeamMembersByTeamIdUseCase {
  const GetTeamMembersByTeamIdUseCase(this._teamRepository);

  final TeamRepository _teamRepository;

  Future<Result<List<TeamMemberModel>>> call({required int teamId}) async {
    return _teamRepository.getTeamMembersByTeamId(teamId);
  }
}
