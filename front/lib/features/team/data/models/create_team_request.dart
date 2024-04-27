import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_team_request.g.dart';

@JsonSerializable()
class CreateTeamRequest {
  CreateTeamRequest({
    required this.name,
    required this.description,
  });

  factory CreateTeamRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateTeamRequestFromJson(json);
  final String name, description;
  Map<String, dynamic> toJson() => _$CreateTeamRequestToJson(this);
}
