import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:front/core/config/providers/dio.dart';
import 'package:front/core/project/data/data_sources/remote_data_source.dart';
import 'package:front/core/project/data/models/project.dart';
import 'package:front/core/project/data/models/project_request.dart';
import 'package:front/core/utils/exception.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import '../../../../helpers/dummy_data/project/api_response.dart';
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

  var projectModel = ProjectModel(
    projectId: 1,
    name: 'name1',
    description: 'description1',
    managerId: 2,
    projectState: 'BEFORE',
  );

  var projectRequestModel = ProjectRequestModel(
      managerId: projectModel.managerId,
      name: projectModel.name,
      description: projectModel.description);

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

    test('should return server exception when a call to api is unsuccessful',
        () async {
      var teamId = 1;
      dioAdapter.onGet(
          '/v1/projects/$teamId', (server) => server.reply(500, null));

      expect(projectRemoteDataSource.getProjectsByTeamId(teamId),
          throwsA(isA<ServerException>()));
    });
  });

  group('get a project by id', () {
    test('should return all a project when a http call is successful',
        () async {
      var projectId = projectModel.projectId;
      dioAdapter.onGet('/v1/project/$projectId',
          (server) => server.reply(200, getProjectByIdDummyData));

      var result = await projectRemoteDataSource.getProjectById(projectId);

      expect(result, equals(projectModel));
    });

    test('should return server exception when a call to api is unsuccessful',
        () async {
      var projectId = projectModel.projectId;
      dioAdapter.onGet(
          '/v1/project/$projectId', (server) => server.reply(500, null));

      expect(projectRemoteDataSource.getProjectsByTeamId(projectId),
          throwsA(isA<ServerException>()));
    });
  });

  group('update a project', () {
    test('should return updated project when a http call is successful',
        () async {
      var projectId = projectModel.projectId;

      dioAdapter.onPatch(
          '/v1/project/$projectId',
          data: projectRequestModel.toJson(),
          (server) => server.reply(200, updateProjectDummyData));

      var result = await projectRemoteDataSource.updateProjectById(
          projectRequestModel, projectId);

      expect(result, equals(projectModel));
    });

    test('should return server exception when a call to api is unsuccessful',
        () async {
      var projectId = projectModel.projectId;
      dioAdapter.onGet(
          '/v1/project/$projectId', (server) => server.reply(500, null));

      expect(
          projectRemoteDataSource.updateProjectById(
              projectRequestModel, projectId),
          throwsA(isA<ServerException>()));
    });
  });

  group('delete a project', () {
    test('should return whithout exception when a http call is successful',
        () async {
      var projectId = projectModel.projectId;

      dioAdapter.onDelete(
          '/v1/project/$projectId',
          data: projectRequestModel.toJson(),
          (server) => server.reply(200, deleteProjectDummyData));

      expect(()async=> await projectRemoteDataSource.deleteProjectById(projectId), isA<void>());
    });

    test('should return server exception when a call to api is unsuccessful',
        () async {
      var projectId = projectModel.projectId;
      dioAdapter.onDelete(
          '/v1/project/$projectId', (server) => server.reply(500, null));

      expect(projectRemoteDataSource.deleteProjectById(projectId),
          throwsA(isA<ServerException>()));
    });
  });
}
