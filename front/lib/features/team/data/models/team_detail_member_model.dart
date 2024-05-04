import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front/features/team/entities/team_members.dart';
import 'package:front/features/user/data/models/user.dart';

part 'team_detail_member_model.freezed.dart';
part 'team_detail_member_model.g.dart';

@freezed
class TeamDetailMemberModel with _$TeamDetailMemberModel {
  factory TeamDetailMemberModel({
    required int id,
    required String email,
    required String imageUrl,
    required String nickname,
    required String role,
  }) = _TeamDetailMemberModel;

  factory TeamDetailMemberModel.fromJson(Map<String, dynamic> json) =>
      _$TeamDetailMemberModelFromJson(json);

  factory TeamDetailMemberModel.fromEntity(TeamMembers teamMembers) {
    return TeamDetailMemberModel(
      id: teamMembers.id,
      email: teamMembers.email,
      imageUrl: teamMembers.imageUrl,
      nickname: teamMembers.nickname,
      role: teamMembers.role,
    );
  }

  UserModel toUserModel() {
    return UserModel(
      id: id,
      email: email,
      nickName: nickname,
      imageUrl: imageUrl,
      type: 'DEFAULT',
    );
  }

  TeamDetailMemberModel._();
}
