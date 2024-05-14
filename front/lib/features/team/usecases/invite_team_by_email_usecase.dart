import 'package:dartz/dartz.dart';
import 'package:front/core/utils/failure.dart';
import 'package:front/features/team/data/models/invite_team.dart';
import 'package:front/features/team/repositories/team_repository.dart';

final class InviteTeamByEmailUseCase {
  const InviteTeamByEmailUseCase(this._teamRepository);
  final TeamRepository _teamRepository;

  Future<Either<Failure, void>> call({required InviteTeam inviteTeam}) async {
    return _teamRepository.inviteTeamByEmail(inviteTeam);
  }
}
