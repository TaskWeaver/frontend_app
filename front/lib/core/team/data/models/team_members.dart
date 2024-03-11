import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front/core/team/domain/entities/team_members.dart';

part 'team_members.freezed.dart';
part 'team_members.g.dart';

@freezed
class TeamMembersModel with _$TeamMembersModel {
  factory TeamMembersModel({
    required int id,
    required String email,
    required String imageUrl,
    required String nickname,
    required String role,
  }) = _TeamMembersModel;

  factory TeamMembersModel.fromJson(Map<String, dynamic> json) =>
      _$TeamMembersModelFromJson(json);

  factory TeamMembersModel.fromEntity(TeamMembers teamMembers) {
    return TeamMembersModel(
      id: teamMembers.id,
      email: teamMembers.email,
      imageUrl: teamMembers.imageUrl,
      nickname: teamMembers.nickname,
      role: teamMembers.role,
    );
  }

  TeamMembersModel._();

  TeamMembers toEntity() {
    return TeamMembers(
      id: id,
      email: email,
      imageUrl: imageUrl,
      nickname: nickname,
      role: role,
    );
  }
}
