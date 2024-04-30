///회원가입 시 서버로부터 받는 응답
import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  SignUpResponse({
    required this.id,
    required this.email,
    required this.type,
    required this.accessToken,
    required this.refreshToken,
    this.nickname,
    this.password,
    this.imageUrl,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);

  final String id;
  final String email;
  final String type;
  final String accessToken;
  final String refreshToken;
  final String? nickname;
  final String? password;
  final String? imageUrl;

  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);
}
