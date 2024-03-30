import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:front/core/utils/exception.dart';
import 'package:front/core/utils/failure.dart';
import 'package:front/features/project/data/data_sources/temp_data_source.dart';
import 'package:front/features/project/data/models/project.dart';
import 'package:front/features/project/data/repositories/project_repository_impl.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockProjectRemoteDataSource mockProjectRemoteDataSource;
  late ProjectRepositoryImpl projectRepository;

  var projectModelList = List.generate(
      3,
      (index) => ProjectModel(
            projectId: 1,
            name: 'name1',
            description: 'description1',
            managerId: 2,
            projectState: 'BEFORE',
          ));
  var projectsEntity = projectModelList.map((e) => e.toEntity()).toList();

  var projectModel = ProjectModel(
    projectId: 1,
    name: 'name1',
    description: 'description1',
    managerId: 2,
    projectState: 'BEFORE',
  );
  var projectEntity = projectModel.toEntity();

  setUp(() {
    mockProjectRemoteDataSource = MockProjectRemoteDataSource();
    projectRepository = ProjectRepositoryImpl(
        projectRemoteDataSource: mockProjectRemoteDataSource,
        projectTempDataSource: ProjectTempDataSource());
  });

  group('get projects by team id', () {
    test('should return all projects when a call to data source is successful',
        () async {
      when(mockProjectRemoteDataSource.getProjectsByTeamId(1))
          .thenAnswer((_) async => projectModelList);

      var result = await projectRepository.getProjectsByTeamId(1);

      expect(result.fold((l) => l, (r) => r),
          equals(Right(projectsEntity).fold((l) => l, (r) => r)));
    });

    test(
        'should return server failure when a call to data source is unsuccessful',
        () async {
      when(mockProjectRemoteDataSource.getProjectsByTeamId(1))
          .thenThrow(ServerException());

      var result = await projectRepository.getProjectsByTeamId(1);

      expect(
          result, equals(const Left(ServerFailure('An error has occurred'))));
    });

    test(
        'should return connection failure when the device has no internet connection',
        () async {
      when(mockProjectRemoteDataSource.getProjectsByTeamId(1))
          .thenThrow(const SocketException('Failed to conect to the network'));

      var result = await projectRepository.getProjectsByTeamId(1);
      expect(
          result,
          equals(
              const Left(ServerFailure('Failed to connect to the network'))));
    });
  });

  group('get project by id', () {
    test(
        'should return project of given id when a call to data source is successful',
        () async {
      when(mockProjectRemoteDataSource.getProjectById(1))
          .thenAnswer((_) async => projectModel);

      var result = await projectRepository.getProjectById(1);

      expect(result, equals(Right(projectEntity)));
    });

    test(
        'should return server failure when a call to data source is unsuccessful',
        () async {
      when(mockProjectRemoteDataSource.getProjectById(1))
          .thenThrow(ServerException());

      var result = await projectRepository.getProjectById(1);

      expect(
          result, equals(const Left(ServerFailure('An error has occurred'))));
    });

    test(
        'should return connection failure when the device has no internet connection',
        () async {
      when(mockProjectRemoteDataSource.getProjectById(1))
          .thenThrow(const SocketException('Failed to conect to the network'));

      var result = await projectRepository.getProjectById(1);
      expect(
          result,
          equals(
              const Left(ServerFailure('Failed to connect to the network'))));
    });
  });
}
