import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_response.freezed.dart';
part 'token_response.g.dart';

///TokenResponse는 토큰 받기 위해 정의하는 클래스입니다.
@freezed
abstract class TokenResponse with _$TokenResponse {
  const factory TokenResponse({
    required String accessToken,
  }) = _TokenResponse;

  factory TokenResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseFromJson(json);
}
