import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:front/core/project/data/models/project.dart';
import 'package:front/core/project/domain/repositories/project_repository.dart';
import 'package:front/core/project/domain/usecases/get_projects_by_team_id_usecase.dart';
import 'package:front/core/utils/failure.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late ProjectRepository mockProjectRepository;
  late GetProjectsByTeamIdUseCase getProjectsByTeamIdUseCase;

  setUp(() {
    mockProjectRepository = MockProjectRepository();
    getProjectsByTeamIdUseCase =
        GetProjectsByTeamIdUseCase(mockProjectRepository);
  });

  var projectModelList = List.generate(
      3,
      (index) => ProjectModel(
            pro_id: 'pro_id$index',
            team_id: 'team_id$index',
            name: 'name$index',
            discription: 'description$index',
            created_at: DateTime(2020, 10, 10, 14, 58, 4),
            finished_at: DateTime(2020, 10, 10, 14, 58, 4),
            deleted_at: DateTime(2020, 10, 10, 14, 58, 4),
          ));
  var projectsModel = ProjectsModel(values: projectModelList);
  var projectsEntity = projectsModel.toEntity();

  test(
      'should get projects of given team id from the repository when call is successful',
      () async {
    when(mockProjectRepository.getProjectsByTeamId('teamId'))
        .thenAnswer((_) async => Right(projectsEntity));

    var result = await getProjectsByTeamIdUseCase('teamId');

    expect(result, equals(Right(projectsEntity)));
  });

  test(
      'should get server failure from the repository when call is unsuccessful',
      () async {
    when(mockProjectRepository.getProjectsByTeamId('teamId')).thenAnswer(
        (_) async => const Left(ServerFailure('An error has occurred')));

    var result = await getProjectsByTeamIdUseCase('teamId');

    expect(result, equals(const Left(ServerFailure('An error has occurred'))));
  });

  test(
      'should get socket failure from the repository when the device has no internet connection',
      () async {
    when(mockProjectRepository.getProjectsByTeamId('teamId')).thenAnswer(
        (_) async =>
            const Left(ServerFailure('Failed to connect to the network')));

    var result = await getProjectsByTeamIdUseCase('teamId');

    expect(result,
        equals(const Left(ServerFailure('Failed to connect to the network'))));
  });
}
