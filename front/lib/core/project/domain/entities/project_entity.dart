// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front/core/const/enum.dart';

part 'project_entity.freezed.dart';

@freezed
class ProjectEntity with _$ProjectEntity {
  factory ProjectEntity({
    required int projectId,
    required String name,
    required String description,
    required int managerId,
    required ProjectStateEnum projectState,
  }) = _ProjectEntity;
}
