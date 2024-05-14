
import 'package:dartz/dartz.dart';
import 'package:front/core/utils/failure.dart';
import 'package:front/features/team/data/models/invite_response.dart';
import 'package:front/features/team/repositories/team_repository.dart';

final class AnswerToInvitationUseCase {
  const AnswerToInvitationUseCase(this._teamRepository);
  final TeamRepository _teamRepository;

  Future<Either<Failure, void>> call(
      {required InviteResponse inviteResponse}) async {
    return _teamRepository.answerToInvitation(inviteResponse);
  }
}
