import 'package:front/features/team/repositories/team_repository.dart';
import 'package:front/core/utils/api_response.dart';
import 'package:front/core/utils/result.dart';

final class DeleteMemberUseCase {
  const DeleteMemberUseCase(this._teamRepository);

  final TeamRepository _teamRepository;

  Future<Result<ApiResponse>> call(
      {required int teamId, required List<int> memberId}) async {
    return _teamRepository.deleteMember(
      teamId: teamId,
      memberId: memberId,
    );
  }
}
