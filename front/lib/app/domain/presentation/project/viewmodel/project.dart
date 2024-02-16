import 'package:dartz/dartz.dart';
import 'package:front/app/domain/presentation/project/state/project_state.dart';
import 'package:front/core/project/data/models/project_create.dart';
import 'package:front/core/project/domain/entities/project.dart';
import 'package:front/core/project/domain/usecases/riverpod.dart';
import 'package:front/core/utils/failure.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project.g.dart';

@riverpod
class ProjectViewmodel extends _$ProjectViewmodel {
  @override
  ProjectState build() => const ProjectState.loading();

  Future<void> getProjectById(String projectId) async {
    var result = await ref.read(getProjectByIdUseCaseProvider)(projectId);
    result.fold(
      (l) => state = ProjectState.error(message: l.message),
      (r) => state = ProjectState(r),
    );
  }

  Future<Either<Failure, Project>> createProject(ProjectCreateModel project) async {
    return await ref.read(createProjectUseCaseProvider)(project);
  }
}
