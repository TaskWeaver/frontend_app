import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:front/core/config/providers/dio.dart';
import 'package:front/core/project/data/data_sources/remote_data_source.dart';
import 'package:front/core/project/data/models/project.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/dummy_data/project/api_response.dart';
import '../../../../helpers/json_reader.dart';
import '../../../../helpers/provider_container.dart';

void main() {
  var container = createContainer();
  late DioAdapter dioAdapter;
  late Dio dio;

  late ProjectRemoteDataSource projectRemoteDataSource;

  var projectModelList = List.generate(
      4,
      (index) => ProjectModel(
            projectId: index,
            name: 'name$index',
            description: 'description$index',
            managerId: index + 1,
            projectState: 'BEFORE',
          ));
  var projectEntityList = projectModelList.map((e) => e.toEntity()).toList();

  var projectModel = ProjectModel(
    projectId: 1,
    name: 'name1',
    description: 'description1',
    managerId: 2,
    projectState: 'BEFORE',
  );
  var projectEntity = projectModel.toEntity();

  setUp(() {
    dio = container.read(dioProvider);
    projectRemoteDataSource = ProjectRemoteDataSourceImpl(dio: dio);
    dioAdapter = DioAdapter(dio: dio);
  });

  group('get projects by team id', () {
    test('should return all projects when a http call is successful', () async {
      var teamId = 1;
      dioAdapter.onGet('/v1/projects/$teamId',
          (server) => server.reply(200, getProjectsByTeamIdDummyData));

      var result = await projectRemoteDataSource.getProjectsByTeamId(teamId);

      expect(result, equals(projectModelList));
    });

    test('should return server failure when a call to api is unsuccessful',
        () async {
      var teamId = 1;
      dioAdapter.onGet('/v1/projects/$teamId',
          (server) => server.reply(500, null));

      expect(projectRemoteDataSource.getProjectsByTeamId(teamId),
          throwsA(isA<ServerException>()));
    });
  });

  });

//   group('get project by id', () {
//     test(
//         'should return project of given id when a call to data source is successful',
//         () async {
//       when(mockProjectRemoteDataSource.getProjectById(1))
//           .thenAnswer((_) async => projectModel);

//       var result = await projectRepository.getProjectById(1);

//       expect(result, equals(Right(projectEntityList)));
//     });

//     test(
//         'should return server failure when a call to data source is unsuccessful',
//         () async {
//       when(mockProjectRemoteDataSource.getProjectById(1))
//           .thenThrow(ServerException());

//       var result = await projectRepository.getProjectById(1);

//       expect(
//           result, equals(const Left(ServerFailure('An error has occurred'))));
//     });

//     test(
//         'should return connection failure when the device has no internet connection',
//         () async {
//       when(mockProjectRemoteDataSource.getProjectById(1))
//           .thenThrow(const SocketException('Failed to conect to the network'));

//       var result = await projectRepository.getProjectById(1);
//       expect(
//           result,
//           equals(
//               const Left(ServerFailure('Failed to connect to the network'))));
//     });
//   });
}
