import 'package:front/core/utils/api_response.dart';
import 'package:front/core/utils/result.dart';
import 'package:front/features/team/data/models/team_model.dart';
import 'package:front/features/team/repositories/team_repository.dart';

final class GetTeamsUseCase {
  const GetTeamsUseCase(this._teamRepository);

  final TeamRepository _teamRepository;

  Future<Result<ApiResponse<List<TeamModel>>>> call() async {
    return _teamRepository.getTeams();
  }
}
