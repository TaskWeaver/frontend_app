import 'dart:convert';

import '../../json_reader.dart';

var getProjectsByTeamIdDummyData = {
  'result': json
      .decode(readJson('helpers/dummy_data/project/projects_dummy_data.json')),
  'resultCode': 200,
  'resultMsg': 'SELECT SUCCESS',
};

var createProjectDummyData = {
  'result': json
      .decode(readJson('helpers/dummy_data/project/project_dummy_data.json')),
  'resultCode': 201,
  'resultMsg': 'INSERT SUCCESS',
};

var getProjectByIdDummyData = {
  'result': json
      .decode(readJson('helpers/dummy_data/project/project_dummy_data.json')),
  'resultCode': 200,
  'resultMsg': 'SELECT SUCCESS',
};

var updateProjectDummyData = {
  'result': json
      .decode(readJson('helpers/dummy_data/project/project_dummy_data.json')),
  'resultCode': 204,
  'resultMsg': 'UPDATE SUCCESS',
};

var updateProjectStateDummyData = {
  'result': null,
  'resultCode': 204,
  'resultMsg': 'UPDATE SUCCESS',
};

var deleteProjectDummyData = {
  'result': null,
  'resultCode': 200,
  'resultMsg': 'DELETE SUCCESS',
};
