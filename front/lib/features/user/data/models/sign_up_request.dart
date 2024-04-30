import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequest {
  SignUpRequest({
    required this.id,
    required this.email,
    required this.nickname,
  });

  factory SignUpRequest.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestFromJson(json);
  final int id;
  final String email;
  final String nickname;
  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}
