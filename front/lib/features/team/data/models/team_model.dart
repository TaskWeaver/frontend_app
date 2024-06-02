import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front/features/team/data/models/team_member_model.dart';

part 'team_model.freezed.dart';
part 'team_model.g.dart';

@freezed
class TeamModel with _$TeamModel {
  factory TeamModel({
    required int id,
    required String name,
    String? description,
    required int teamLeader,
    required String inviteLink,
    required DateTime createdAt,
    required String myRole,
    required int totalMembers,
    required List<TeamMemberModel> members,
  }) = _TeamModel;

  factory TeamModel.fromJson(Map<String, dynamic> json) =>
      _$TeamModelFromJson(json);
}
