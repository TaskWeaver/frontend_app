import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_request_model.g.dart';

@JsonSerializable()
class SignUpRequestModel {
  SignUpRequestModel({
    required this.id,
    required this.email,
    required this.nickname,
  });

  factory SignUpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestModelFromJson(json);
  final int id;
  final String email;
  final String nickname;
  Map<String, dynamic> toJson() => _$SignUpRequestModelToJson(this);
}
