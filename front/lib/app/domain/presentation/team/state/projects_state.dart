
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front/core/project/domain/entities/projects.dart';

part 'projects_state.freezed.dart';

@freezed
class ProjectsState with _$ProjectsState {
  const factory ProjectsState.loading() = _ProjectStateLoading;
  const factory ProjectsState.error({String? message}) = _ProjectStateError;
  const factory ProjectsState(Projects projects) = _ProjectStateData;
}