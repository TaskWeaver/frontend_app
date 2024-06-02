import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_member_model.freezed.dart';
part 'team_member_model.g.dart';

@freezed
class TeamMemberModel with _$TeamMemberModel {
  factory TeamMemberModel({
    required int id,
    required String imageUrl,
  }) = _TeamMemberModel;

  factory TeamMemberModel.fromJson(Map<String, dynamic> json) =>
      _$TeamMemberModelFromJson(json);
}
