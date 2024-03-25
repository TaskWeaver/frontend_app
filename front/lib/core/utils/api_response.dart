import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front/features/data/models/team.dart';

part 'api_response.g.dart';

@JsonSerializable()
class ApiResponse<T> {
  final Map<String, dynamic> result;
  final int resultCode;
  final String resultMsg;

  ApiResponse({
    required this.result,
    required this.resultCode,
    required this.resultMsg,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);

  // TeamModel toTeamModel(Map<String, dynamic> json) {
  //   return TeamModel(
  //     id: json['result']['id'],
  //     name: json['result']['name'],
  //     inviteLink: json['result']['inviteLink'],
  //     createdAt: json['result']['name'],
  //   );
  // }
}
