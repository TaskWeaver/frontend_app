
import 'package:dartz/dartz.dart';
import 'package:front/core/utils/failure.dart';
import 'package:front/features/team/repositories/team_repository.dart';

final class InvitationNotificationUseCase {
  const InvitationNotificationUseCase(this._teamRepository);
  final TeamRepository _teamRepository;

  Future<Either<Failure, void>> call() async {
    return _teamRepository.invitationNotification();
  }
}
