import 'package:front/core/utils/api_response.dart';
import 'package:front/core/utils/result.dart';
import 'package:front/features/team/repositories/team_repository.dart';

final class InvitationNotificationUseCase {
  const InvitationNotificationUseCase(this._teamRepository);
  final TeamRepository _teamRepository;

  Future<Result<ApiResponse>> call() async {
    return _teamRepository.invitationNotification();
  }
}
