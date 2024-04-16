import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_members_model.g.dart';

@JsonSerializable()
class ProjectMembersModel extends Equatable {
  const ProjectMembersModel({
    required this.id,
    this.imageUrl,
    required this.nickname,
  });

  final int id;
  final String? imageUrl;
  final String nickname;

  @override
  List<Object?> get props => [id, imageUrl, nickname];

  factory ProjectMembersModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectMembersModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectMembersModelToJson(this);
}