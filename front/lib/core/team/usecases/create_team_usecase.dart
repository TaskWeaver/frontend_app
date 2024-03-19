import 'package:front/core/team/data/models/team.dart';
import 'package:front/core/team/repositories/team_repository.dart';
import 'package:front/core/utils/result.dart';

final class CreateTeamUseCase {
  const CreateTeamUseCase(this._teamRepository);

  final TeamRepository _teamRepository;

  Future<Result<TeamModel>> call({required Map<String, dynamic> name}) async {
    return _teamRepository.createTeam(name);
  }
}
