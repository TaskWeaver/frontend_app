import 'package:freezed_annotation/freezed_annotation.dart';
part 'invite_response.g.dart';

@JsonSerializable()
class InviteResponse {
  final int team_id;
  final int inviteState;

  InviteResponse({
    required this.team_id,
    required this.inviteState,
  });

  Map<String, dynamic> toJson() => _$InviteResponseToJson(this);
}