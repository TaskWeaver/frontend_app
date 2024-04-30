// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

///User의 로그인 및 마이페이지 조회 정보를 받기위해 사용되는 모델

@freezed
class UserModel with _$UserModel {
  factory UserModel(
      {required int id,
      required String email,
      required String nickName,
      String? imageUrl,
      required String type}) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromModel(UserModel user) {
    return UserModel(
      id: user.id,
      email: user.email,
      nickName: user.nickName,
      imageUrl: user.imageUrl,
      type: user.type,
    );
  }
}
