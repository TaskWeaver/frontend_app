import 'package:dartz/dartz.dart';
import 'package:front/core/utils/failure.dart';
import 'package:front/features/team/repositories/team_repository.dart';

final class DeleteMemberUseCase {
  const DeleteMemberUseCase(this._teamRepository);

  final TeamRepository _teamRepository;

  Future<Either<Failure, void>> call(
      {required int teamId, required Map<String, dynamic> memberId}) async {
    return _teamRepository.deleteMember(
      teamId: teamId,
      memberId: memberId,
    );
  }
}
