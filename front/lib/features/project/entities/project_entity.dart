// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front/core/const/enum.dart';

part 'project_entity.freezed.dart';

@freezed
class Project with _$Project {
  factory Project({
    required int projectId,
    required String name,
    required String description,
    required int managerId,
    required ProjectStateEnum projectState,
    required DateTime createdAt,
    List<int>? memberId,
  }) = _Project;
}
