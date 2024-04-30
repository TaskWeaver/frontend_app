import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front/features/team/data/models/team_detail_member_model.dart';

part 'team_detail_model.freezed.dart';
part 'team_detail_model.g.dart';

@freezed
class TeamDetailModel with _$TeamDetailModel {
  factory TeamDetailModel({
    required int id,
    required String name,
    String? description,
    required int teamLeader,
    required String inviteLink,
    required DateTime createdAt,
    required String myRole,
    required List<TeamDetailMemberModel> teamMembers,
    required int memberCount,
  }) = _TeamDetailModel;

  factory TeamDetailModel.fromJson(Map<String, dynamic> json) =>
      _$TeamDetailModelFromJson(json);
}
