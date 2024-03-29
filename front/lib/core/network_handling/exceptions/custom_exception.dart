sealed class CustomException implements Exception {
  const CustomException(this.code, this.message);

  final String code;
  final String message;

  @override
  String toString() => '$code: $message';
}

class UnAuthorizedException extends CustomException {
  const UnAuthorizedException() : super('000000', '유저 인증 정보를 불러올 수 없습니다.');
}

class AlreadyExistUserDataException extends CustomException {
  const AlreadyExistUserDataException() : super('100001', '이미 유저 데이터가 존재합니다.');
}

class NoUserDataException extends CustomException {
  const NoUserDataException() : super('100002', '유저 데이터가 존재하지않습니다.');
}

class LocalDataNotUpdatedException extends CustomException {
  const LocalDataNotUpdatedException()
      : super('100003', '로컬 데이터를 업데이트 할 수 없습니다.');
}

class SnsOAuthLoginCancledException extends CustomException {
  const SnsOAuthLoginCancledException() : super('100004', 'sns 로그인을 취소했습니다.');
}

class ParsingEnumException extends CustomException {
  const ParsingEnumException() : super('100005', '해당하는 enum 값을 찾을 수 없습니다.');
}

class AlreadyExistNicknameException extends CustomException {
  const AlreadyExistNicknameException() : super('100006', '중복된 닉네임입니다.');
}

class NoFirebaseUserException extends CustomException {
  const NoFirebaseUserException()
      : super('100007', '파이어베이스 유저 데이터가 존재하지 않습니다.');
}

class NoFirebaseUserEssentialDataException extends CustomException {
  const NoFirebaseUserEssentialDataException()
      : super('100008', '파이어베이스 유저 필수 데이터가 없습니다.');
}

class ImageNotCompressedException extends CustomException {
  const ImageNotCompressedException() : super('100009', '이미지 변환에 실패했습니다.');
}

class InvalidMimeTypeException extends CustomException {
  const InvalidMimeTypeException() : super('100009', '올바른 Mime 타입이 아닙니다.');
}
