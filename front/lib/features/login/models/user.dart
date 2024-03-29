// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

///User의 로그인 및 마이페이지 조회 정보를 받기위해 사용되는 모델

@JsonSerializable()
class UserModel {
  UserModel({
    required this.id,
    required this.email,
    required this.nickname, // 이 부분을 수정
    this.imageUrl,
    required this.type,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  final int id;
  final String email, nickname, type;
  final String? imageUrl;

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class LoginResponse {
  final int id;
  final String email, type, accessToken, refreshToken;

  LoginResponse(
      {required this.id,
      required this.email,
      required this.type,
      required this.accessToken,
      required this.refreshToken});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

///회원가입 요청에서 사용되는 모델
@freezed
class UserRegistrationRequest with _$UserRegistrationRequest {
  const UserRegistrationRequest._(); // private constructor
  const factory UserRegistrationRequest({
    required String email,
    required String nickname,
    String? imageUrl,
    required String password, // UserRegistration 특유의 필드
  }) = _UserRegistration;

  factory UserRegistrationRequest.fromJson(Map<String, dynamic> json) =>
      _$UserRegistrationRequestFromJson(json);
}

///회원가입 시 서버로부터 받는 응답
@freezed
class UserRegistrationResponse with _$UserRegistrationResponse {
  const UserRegistrationResponse._(); // private constructor
  const factory UserRegistrationResponse({
    required int id, // Optional, 회원가입 요청에서는 id가 없을 수 있음
    required String email,
    required String nickname, // UserRegistration 특유의 필드
  }) = _UserRegistrationResponse;

  factory UserRegistrationResponse.fromJson(Map<String, dynamic> json) =>
      _$UserRegistrationResponseFromJson(json);
}
