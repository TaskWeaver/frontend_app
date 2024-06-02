import 'package:freezed_annotation/freezed_annotation.dart';
part 'invite_team_model.g.dart';

@JsonSerializable()
class InviteTeam {
  final String email;
  // 카멜 케이스로 수정
  final int team_id;

  InviteTeam({
    required this.email,
    required this.team_id,
  });

  factory InviteTeam.fromJson(Map<String, dynamic> json) =>
      _$InviteTeamFromJson(json);

  Map<String, dynamic> toJson() => _$InviteTeamToJson(this);
}