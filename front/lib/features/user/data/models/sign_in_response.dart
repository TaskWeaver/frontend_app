import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_response.g.dart';

@JsonSerializable()
class SignInResponse {
  SignInResponse(
      {required this.id,
      required this.email,
      required this.type,
      required this.accessToken,
      required this.refreshToken});

  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);
  final int id;
  final String email, type, accessToken, refreshToken;
  Map<String, dynamic> toJson() => _$SignInResponseToJson(this);
}
