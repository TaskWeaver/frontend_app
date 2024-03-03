
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front/core/project/domain/entities/project.dart';

part 'project_state.freezed.dart';

@freezed
class ProjectState with _$ProjectState {
  const factory ProjectState.loading() = _ProjectStateLoading;
  const factory ProjectState.error({String? message}) = _ProjectStateError;
  const factory ProjectState(Project projects) = _ProjectStateData;
}