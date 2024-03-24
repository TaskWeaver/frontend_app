import 'package:freezed_annotation/freezed_annotation.dart';
part 'invite_team.g.dart';

@JsonSerializable()
class InviteTeam {
  final String email;
  final int teamId;

  InviteTeam({
    required this.email,
    required this.teamId,
  });

  Map<String, dynamic> toJson() => _$InviteTeamToJson(this);
}