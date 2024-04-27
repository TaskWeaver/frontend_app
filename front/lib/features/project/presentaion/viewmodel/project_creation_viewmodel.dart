import 'package:front/app/locator.dart';
import 'package:front/features/project/data/models/create_project_request.dart';
import 'package:front/features/project/data/models/project_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_creation_viewmodel.g.dart';

@riverpod
class ProjectCreationViewModel extends _$ProjectCreationViewModel {
  @override
  AsyncValue<ProjectModel?> build() => const AsyncValue.data(null);

  Future<void> createProject(
      CreateProjectRequest creatProjectRequest, int teamId) async {
    state = const AsyncValue.loading();
    final response = await createProjectUseCase(creatProjectRequest, teamId);
    response.fold(onSuccess: (value) {
      state = AsyncValue.data(
          ProjectModel.fromJson(value.result as Map<String, dynamic>));
    }, onFailure: (e) {
      state = AsyncValue.error(e, StackTrace.current);
    });
  }
}
