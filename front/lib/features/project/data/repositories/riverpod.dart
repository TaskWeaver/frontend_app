import 'package:front/features/project/data/data_sources/riverpod.dart';
import 'package:front/features/project/data/repositories/project_repository_impl.dart';
import 'package:front/features/project/repositories/project_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'riverpod.g.dart';

@riverpod
ProjectRepository projectRepository(ProjectRepositoryRef ref) {
  var projectRemoteDataSource = ref.read(projectRemoteDataSourceProvider);
  var projectTempDataSource = ref.read(projectTempDataSourceProvider);
  return ProjectRepositoryImpl(
      projectRemoteDataSource: projectRemoteDataSource,
      projectTempDataSource: projectTempDataSource);
}
