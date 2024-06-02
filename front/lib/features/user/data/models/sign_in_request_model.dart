import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_request_model.g.dart';

@JsonSerializable()
class SignInRequestModel {
  SignInRequestModel({
    required this.email,
    required this.password,
  });

  factory SignInRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestModelFromJson(json);
  final String email, password;
  Map<String, dynamic> toJson() => _$SignInRequestModelToJson(this);
}
