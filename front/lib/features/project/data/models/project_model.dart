import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_model.freezed.dart';
part 'project_model.g.dart';

@freezed
class ProjectModel with _$ProjectModel {
  const factory ProjectModel({
    required int projectId,
    required String name,
    required String description,
    required int managerId,
    List<int>? memberId, // 수정된 부분: memberId는 nullable이며 기본값이 null입니다.
    required String projectState,
    required DateTime createdAt,
  }) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);
}
