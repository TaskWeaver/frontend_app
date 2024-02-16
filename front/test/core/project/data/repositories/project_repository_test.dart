import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:front/core/project/data/data_sources/temp_data_source.dart';
import 'package:front/core/project/data/models/project.dart';
import 'package:front/core/project/data/repositories/project_repository_impl.dart';
import 'package:front/core/utils/exception.dart';
import 'package:front/core/utils/failure.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockProjectRemoteDataSource mockProjectRemoteDataSource;
  late ProjectRepositoryImpl projectRepository;

  var projectModelList = List.generate(
      3,
      (index) => ProjectModel(
            pro_id: 'pro_id$index',
            team_id: 'team_id$index',
            name: 'name$index',
            description: 'description$index',
            created_at: DateTime(2020, 10, 10, 14, 58, 4),
            finished_at: DateTime(2020, 10, 10, 14, 58, 4),
            deleted_at: DateTime(2020, 10, 10, 14, 58, 4),
          ));
  var projectsEntity = projectModelList.map((e) => e.toEntity()).toList();

  var projectModel = ProjectModel(
    pro_id: 'pro_id1',
    team_id: 'team_id1',
    name: 'name1',
    description: 'description1',
    created_at: DateTime(2020, 10, 10, 14, 58, 4),
    finished_at: DateTime(2020, 10, 10, 14, 58, 4),
    deleted_at: DateTime(2020, 10, 10, 14, 58, 4),
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
      when(mockProjectRemoteDataSource.getProjectsByTeamId('teamId'))
          .thenAnswer((_) async => projectModelList);

      var result = await projectRepository.getProjectsByTeamId('teamId');

      expect(result, equals(Right(projectsEntity)));
    });

    test(
        'should return server failure when a call to data source is unsuccessful',
        () async {
      when(mockProjectRemoteDataSource.getProjectsByTeamId('teamId'))
          .thenThrow(ServerException());

      var result = await projectRepository.getProjectsByTeamId('teamId');

      expect(
          result, equals(const Left(ServerFailure('An error has occurred'))));
    });

    test(
        'should return connection failure when the device has no internet connection',
        () async {
      when(mockProjectRemoteDataSource.getProjectsByTeamId('teamId'))
          .thenThrow(const SocketException('Failed to conect to the network'));

      var result = await projectRepository.getProjectsByTeamId('teamId');
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
      when(mockProjectRemoteDataSource.getProjectById('projectId'))
          .thenAnswer((_) async => projectModel);

      var result = await projectRepository.getProjectById('projectId');

      expect(result, equals(Right(projectEntity)));
    });

    test(
        'should return server failure when a call to data source is unsuccessful',
        () async {
      when(mockProjectRemoteDataSource.getProjectById('projectId'))
          .thenThrow(ServerException());

      var result = await projectRepository.getProjectById('projectId');

      expect(
          result, equals(const Left(ServerFailure('An error has occurred'))));
    });

    test(
        'should return connection failure when the device has no internet connection',
        () async {
      when(mockProjectRemoteDataSource.getProjectById('projectId'))
          .thenThrow(const SocketException('Failed to conect to the network'));

      var result = await projectRepository.getProjectById('projectId');
      expect(
          result,
          equals(
              const Left(ServerFailure('Failed to connect to the network'))));
    });
  });
}
