import 'package:freezed_annotation/freezed_annotation.dart';
part 'team.freezed.dart';

@freezed
class Team with _$Team {
  factory Team({
    required String teamId,
    required String name,
    required String inviteLink,
    required String teamLeader,
    required String createdAt,
  }) = _Team;
}

