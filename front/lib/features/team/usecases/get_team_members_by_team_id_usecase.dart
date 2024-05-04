import 'package:front/core/utils/result.dart';
import 'package:front/features/team/repositories/team_repository.dart';
import 'package:front/features/user/data/models/user.dart';

final class GetTeamMembersByTeamIdUseCase {
  const GetTeamMembersByTeamIdUseCase(this._teamRepository);

  final TeamRepository _teamRepository;

  Future<Result<List<UserModel>>> call({required int teamId}) async {
    return _teamRepository.getTeamMembersByTeamId(teamId);
  }
}
