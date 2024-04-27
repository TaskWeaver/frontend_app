import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_project_request.g.dart';

@JsonSerializable()
class CreateProjectRequest {
  CreateProjectRequest({
    required this.name,
    required this.description,
    required this.managerId,
    required this.memberIdList,
  });

  factory CreateProjectRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateProjectRequestFromJson(json);
  final String name;
  final String description;
  final int managerId;
  final List<int> memberIdList;

  Map<String, dynamic> toJson() => _$CreateProjectRequestToJson(this);
}
