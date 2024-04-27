import 'package:json_annotation/json_annotation.dart';

part 'project_member.g.dart';

@JsonSerializable()
class ProjectMember {
  ProjectMember({
    required this.id,
    required this.imageUrl,
    required this.nickname,
  });

  factory ProjectMember.fromJson(Map<String, dynamic> json) =>
      _$ProjectMemberFromJson(json);
  final int id;
  final String imageUrl;
  final String nickname;
  Map<String, dynamic> toJson() => _$ProjectMemberToJson(this);
}
