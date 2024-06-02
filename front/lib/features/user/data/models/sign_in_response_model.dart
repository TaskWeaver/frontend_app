import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_response_model.g.dart';

@JsonSerializable()
class SignInResponseModel {
  SignInResponseModel(
      {required this.id,
      required this.email,
      required this.type,
      required this.accessToken,
      required this.refreshToken});

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);
  final int id;
  final String email, type, accessToken, refreshToken;
  Map<String, dynamic> toJson() => _$SignInResponseToJson(this);
}
