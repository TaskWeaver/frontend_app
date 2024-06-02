import 'package:front/features/project/data/models/project_request_model.dart';
import 'package:front/features/project/entities/project.dart';
import 'package:front/features/project/presentaion/state/projects_state.dart';
import 'package:front/features/project/usecases/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_viewmodel.g.dart';

@riverpod
class ProjectViewmodel extends _$ProjectViewmodel {
  @override
  ProjectsState build(int teamId) {
    return const ProjectsState.loading();
  }

  Future<ProjectsState> getProjectsByTeamId(int teamId) async {
    var result = await ref.read(getProjectsByTeamIdUseCaseProvider)(teamId);
    var projectState = result.fold(
      (l) => ProjectsState.error(message: l.message),
      (r) => ProjectsState(r),
    );
    state = projectState;
    return projectState;
  }

  Future<Project> getProjectById(int projectId) async {
    var project = state.whenOrNull((projects) {
      return projects.firstWhere((element) => element.projectId == projectId);
    });
    if (project != null) {
      return project;
    } else {
      var result = await ref.read(getProjectByIdUseCaseProvider)(projectId);

      return result.fold(
        (l) => Future.error(l.message),
        (r) {
          return r;
        },
      );
    }
  }

  Future<void> createProject(ProjectRequestModel project, int teamId) async {
    var result = await ref.read(createProjectUseCaseProvider)(project, teamId);
    return result.fold(
      (l) => throw l,
      (r) {
        if (state.mapOrNull((value) => true) != null) {
          state =
              ProjectsState([...state.whenOrNull((projects) => projects)!, r]);
        }
      },
    );
  }

  Future<void> updateProject(Project project, int projectId) async {
    var result =
        await ref.read(updateProjectByIdUseCaseProvider)(project, projectId);
    return result.fold(
      (l) => throw l,
      (r) {
        if (state.mapOrNull((value) => true) != null) {
          state = ProjectsState([
            ...state.whenOrNull((projects) {
              projects.removeWhere((element) => element.projectId == projectId);
              return projects;
            })!,
            r
          ]);
        }
      },
    );
  }

  Future<void> deleteProject(int projectId) async {
    var result = await ref.read(deleteProjectByIdUseCaseProvider)(projectId);
    result.fold(
      (l) => throw l,
      (r) {
        if (state.mapOrNull((value) => true) != null) {
          state = ProjectsState([
            ...state.whenOrNull((projects) {
              return projects
                  .where((element) => element.projectId != projectId)
                  .toList();
            })!
          ]);
        }
      },
    );
  }
}
