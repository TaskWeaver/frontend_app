import 'package:front/app/locator.dart';
import 'package:front/features/project/data/data_sources/project_remote_data_source_impl.dart';
import 'package:front/features/project/data/data_sources/project_remote_data_sources.dart';
import 'package:front/features/project/data/repositories/project_repositories.dart';
import 'package:front/features/project/data/repositories/project_repositories_impl.dart';
import 'package:front/features/project/usecases/create_project_usecase.dart';
import 'package:front/features/project/usecases/delete_project_by_id_usecase.dart';
import 'package:front/features/project/usecases/get_project_by_id_usecase.dart';
import 'package:front/features/project/usecases/get_projects_by_team_id_usecase.dart';
import 'package:front/features/project/usecases/update_project_by_id_usecase.dart';

class ProjectDependencyInjection {
  void init() {
    dataSources();
    repositories();
    useCases();
    setupLocator();
  }

  void dataSources() {
    locator.registerLazySingleton<ProjectRemoteDataSource>(
      ProjectRemoteDataSourceImpl.new,
    );
  }

  void repositories() {
    locator.registerLazySingleton<ProjectRepository>(
      () => ProjectRepositoryImpl(
        projectRemoteDataSource: projectRemoteDataSource,
      ),
    );
  }

  void useCases() {
    locator
      ..registerFactory<GetProjectsByTeamIdUseCase>(
        () => GetProjectsByTeamIdUseCase(
          projectRepository,
        ),
      )
      ..registerFactory<CreateProjectUseCase>(
        () => CreateProjectUseCase(
          projectRepository,
        ),
      )
      ..registerFactory<DeleteProjectByIdUseCase>(
        () => DeleteProjectByIdUseCase(
          projectRepository,
        ),
      )
      ..registerFactory<GetProjectByIdUseCase>(
        () => GetProjectByIdUseCase(
          projectRepository,
        ),
      )
      ..registerFactory<UpdateProjectByIdUseCase>(
        () => UpdateProjectByIdUseCase(
          projectRepository,
        ),
      );
  }

  Future<void> setupLocator() async {}
}
