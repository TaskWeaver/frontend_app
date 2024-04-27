import 'package:front/features/project/data/models/project_member.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_project_members.g.dart';

@JsonSerializable()
class GetProjectMembers {
  GetProjectMembers({required this.memberList});

  factory GetProjectMembers.fromJson(Map<String, dynamic> json) =>
      _$GetProjectMembersFromJson(json);
  final List<ProjectMember> memberList;
  Map<String, dynamic> toJson() => _$GetProjectMembersToJson(this);
}
