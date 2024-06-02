import 'package:dartz/dartz.dart';
import 'package:front/core/utils/failure.dart';
import 'package:front/features/team/data/models/create_team_request_model.dart';
import 'package:front/features/team/data/models/create_team_response_model.dart';
import 'package:front/features/team/repositories/team_repository.dart';

final class CreateTeamUseCase {
  const CreateTeamUseCase(this._teamRepository);
  final TeamRepository _teamRepository;

  Future<Either<Failure, CreateTeamResponse>> call(
      {required CreateTeamRequest createTeamRequest}) async {
    return _teamRepository.createTeam(createTeamRequest);
  }
}
