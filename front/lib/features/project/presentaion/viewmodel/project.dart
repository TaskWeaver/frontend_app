import 'package:dartz/dartz.dart';
import 'package:front/core/utils/failure.dart';
import 'package:front/features/project/data/models/project_request.dart';
import 'package:front/features/project/entities/project.dart';
import 'package:front/features/project/presentaion/state/project_state.dart';
import 'package:front/features/project/usecases/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project.g.dart';

@riverpod
class ProjectViewmodel extends _$ProjectViewmodel {

  @override
  ProjectState build() => const ProjectState.loading();

  Future<void> getProjectById(int projectId) async {
    var result = await ref.read(getProjectByIdUseCaseProvider)(projectId);
    result.fold(
      (l) => state = ProjectState.error(message: l.message),
      (r) => state = ProjectState(r),
    );
  }

  Future<Either<Failure, Project>> createProject(
      ProjectRequestModel project, int teamId) async {
    return await ref.read(createProjectUseCaseProvider)(project, teamId);
  }

  Future<Either<Failure, Project>> updateProject(
      Project project, int projectId) async {
    return await ref.read(updateProjectByIdUseCaseProvider)(project, projectId);
  }

  Future<Either<Failure, void>> deleteProject(int projectId) async {
    var result = await ref.read(deleteProjectByIdUseCaseProvider)(projectId);
    return result;
  }
}
