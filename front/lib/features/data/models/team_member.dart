import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front/features/domain/entities/team_members.dart';

part 'team_member.freezed.dart';
part 'team_member.g.dart';

@freezed
class TeamMemberModel with _$TeamMemberModel {
  factory TeamMemberModel({
    required int id,
    required String email,
    required String imageUrl,
    required String nickname,
    required String role,
  }) = _TeamMemberModel;

  factory TeamMemberModel.fromJson(Map<String, dynamic> json) =>
      _$TeamMemberModelFromJson(json);

  factory TeamMemberModel.fromEntity(TeamMembers teamMembers) {
    return TeamMemberModel(
      id: teamMembers.id,
      email: teamMembers.email,
      imageUrl: teamMembers.imageUrl,
      nickname: teamMembers.nickname,
      role: teamMembers.role,
    );
  }

  TeamMemberModel._();

  // TeamMemberModel toEntity() {
  //   return TeamMemberModel(
  //     id: id,
  //     email: email,
  //     imageUrl: imageUrl,
  //     nickname: nickname,
  //     role: role,
  //   );
  // }
}
