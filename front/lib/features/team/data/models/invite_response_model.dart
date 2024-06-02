import 'package:freezed_annotation/freezed_annotation.dart';

part 'invite_response_model.g.dart';

@JsonSerializable()
class InviteResponse {
  InviteResponse({
    required this.team_id,
    required this.inviteState,
  });
  // 카멜 케이스로 수정
  final int team_id;
  final int inviteState;

  Map<String, dynamic> toJson() => _$InviteResponseToJson(this);
}
