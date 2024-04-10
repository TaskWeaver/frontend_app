import 'package:freezed_annotation/freezed_annotation.dart';
part 'invite_response.g.dart';

@JsonSerializable()
class InviteResponse {
  final int teamId;
  final int inviteState;

  InviteResponse({
    required this.teamId,
    required this.inviteState,
  });

  Map<String, dynamic> toJson() => _$InviteResponseToJson(this);
}