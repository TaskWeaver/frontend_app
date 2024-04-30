import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_request.g.dart';

@JsonSerializable()
class SignInRequest {
  SignInRequest({
    required this.email,
    required this.password,
  });

  factory SignInRequest.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestFromJson(json);
  final String email, password;
  Map<String, dynamic> toJson() => _$SignInRequestToJson(this);
}
