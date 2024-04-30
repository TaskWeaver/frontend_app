import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password.g.dart';

@JsonSerializable()
class ChangePassword {
  ChangePassword({
    required this.oldPassword,
    required this.newPassword,
  });

  factory ChangePassword.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordFromJson(json);
  final String oldPassword, newPassword;
  Map<String, dynamic> toJson() => _$ChangePasswordToJson(this);
}
