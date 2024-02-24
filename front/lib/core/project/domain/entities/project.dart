// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';

@freezed
class Project with _$Project {
  factory Project({
    required String pro_id,
    required String team_id,
    required String name,
    required String description,
    required DateTime created_at,
    required DateTime finished_at,
    required DateTime deleted_at,
  }) = _Project;

}
