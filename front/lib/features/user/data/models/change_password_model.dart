import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_model.g.dart';

@JsonSerializable()
class ChangePasswordModel {
  ChangePasswordModel({
    required this.oldPassword,
    required this.newPassword,
  });

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordModelFromJson(json);
  final String oldPassword, newPassword;
  Map<String, dynamic> toJson() => _$ChangePasswordModelToJson(this);
}
