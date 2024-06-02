
import 'package:front/features/team/data/models/team_member_model.dart';
import 'package:front/features/team/repositories/team_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:front/core/utils/failure.dart';
final class GetTeamMembersByTeamIdUseCase {
  const GetTeamMembersByTeamIdUseCase(this._teamRepository);

  final TeamRepository _teamRepository;

  Future<Either<Failure ,List<TeamMemberModel>>> call({required int teamId}) async {
    return _teamRepository.getTeamMembersByTeamId(teamId);
  }
}
