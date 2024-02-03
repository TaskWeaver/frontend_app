import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front/core/project/domain/entities/project.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class ProjectModel with _$ProjectModel {
  factory ProjectModel({
    required String pro_id,
    required String team_id,
    required String name,
    required String discription,
    required DateTime created_at,
    required DateTime finished_at,
    required DateTime deleted_at,
  }) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);

  ProjectModel._();

  Project toEntity() {
    return Project(
        pro_id: pro_id,
        team_id: team_id,
        name: name,
        discription: discription,
        created_at: created_at,
        finished_at: finished_at,
        deleted_at: deleted_at);
  }
}
