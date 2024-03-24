
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front/core/project/domain/entities/project.dart';

part 'projects_state.freezed.dart';

@freezed
class ProjectsState with _$ProjectsState {
  const factory ProjectsState.loading() = _ProjectsStateLoading;
  const factory ProjectsState.error({String? message}) = _ProjectsStateError;
  const factory ProjectsState(List<Project> projects) = _ProjectsStateData;
}