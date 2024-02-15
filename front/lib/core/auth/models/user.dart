import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

///공통 필드
abstract class UserBase {
  int? get id; // 회원가입 요청에서는 제외될 수 있음
  String get email;
  String? get nickname;
  String? get imageUrl;
}

///User의 로그인 및 마이페이지 조회 정보를 받기위해 사용되는 모델
@freezed
class UserModel with _$UserModel implements UserBase {
  const UserModel._(); // private constructor
  const factory UserModel({
    required int id,
    required String email,
    String? nickname, // 이 부분을 수정
    String? imageUrl,
    String? accessToken,
    String? refreshToken,
    required String type,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

///회원가입 요청에서 사용되는 모델
@freezed
class UserRegistrationRequest
    with _$UserRegistrationRequest
    implements UserBase {
  const UserRegistrationRequest._(); // private constructor
  const factory UserRegistrationRequest({
    int? id, // Optional, 회원가입 요청에서는 id가 없을 수 있음
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
class UserRegistrationResponse
    with _$UserRegistrationResponse
    implements UserBase {
  const UserRegistrationResponse._(); // private constructor
  const factory UserRegistrationResponse({
    int? id, // Optional, 회원가입 요청에서는 id가 없을 수 있음
    required String email,
    required String nickname,
    String? imageUrl, // UserRegistration 특유의 필드
  }) = _UserRegistrationResponse;

  factory UserRegistrationResponse.fromJson(Map<String, dynamic> json) =>
      _$UserRegistrationResponseFromJson(json);
}
