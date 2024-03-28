import 'package:freezed_annotation/freezed_annotation.dart';
part 'team_members.freezed.dart';

@freezed
class TeamMembers with _$TeamMembers {
  factory TeamMembers({
    required int id,
    required String email,
    required String imageUrl,
    required String nickname,
    required String role,
  }) = _TeamMembers;
}

