import 'package:front/features/team/data/models/invite_response.dart';
import 'package:front/core/utils/api_response.dart';
import 'package:front/core/utils/result.dart';
import 'package:front/features/team/repositories/team_repository.dart';

final class AnswerToInvitationUseCase {
  const AnswerToInvitationUseCase(this._teamRepository);
  final TeamRepository _teamRepository;

  Future<Result<ApiResponse>> call({required InviteResponse inviteResponse}) async {
    return _teamRepository.answerToInvitation(inviteResponse);
  }
}
