import 'package:front/core/team/domain/entities/team_entity.dart';
import 'package:front/core/team/repositories/team_repository.dart';
import 'package:front/core/utils/result.dart';

final class GetTeamsUseCase {
  const GetTeamsUseCase(this._teamRepository);

  final TeamRepository _teamRepository;

  // Future<Result<List<TeamEntity>>> call() async {
  //   return _teamRepository.getTeams();
  // }
}

