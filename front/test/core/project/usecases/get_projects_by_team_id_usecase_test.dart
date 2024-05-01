import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:front/core/utils/failure.dart';
import 'package:front/features/project/data/models/project.dart';
import 'package:front/features/project/repositories/project_repository.dart';
import 'package:front/features/project/usecases/get_projects_by_team_id_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

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
            createdAt: DateTime.now(),
            projectId: index,
            name: 'name$index',
            description: 'description$index',
            managerId: 2,
            projectState: 'BEFORE',
          ));
  var projectsEntity = projectModelList.map((e) => e.toEntity()).toList();

  test(
      'should get projects of given team id from the repository when call is successful',
      () async {
    when(mockProjectRepository.getProjectsByTeamId(1))
        .thenAnswer((_) async => Right(projectsEntity));

    var result = await getProjectsByTeamIdUseCase(1);

    expect(result, equals(Right(projectsEntity)));
  });

  test(
      'should get server failure from the repository when call is unsuccessful',
      () async {
    when(mockProjectRepository.getProjectsByTeamId(1)).thenAnswer(
        (_) async => const Left(ServerFailure('An error has occurred')));

    var result = await getProjectsByTeamIdUseCase(1);

    expect(result, equals(const Left(ServerFailure('An error has occurred'))));
  });

  test(
      'should get socket failure from the repository when the device has no internet connection',
      () async {
    when(mockProjectRepository.getProjectsByTeamId(1)).thenAnswer((_) async =>
        const Left(ServerFailure('Failed to connect to the network')));

    var result = await getProjectsByTeamIdUseCase(1);

    expect(result,
        equals(const Left(ServerFailure('Failed to connect to the network'))));
  });
}
