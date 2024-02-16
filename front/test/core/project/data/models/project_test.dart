import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:front/core/project/data/models/project.dart';
import 'package:front/core/project/domain/entities/project.dart';

import '../../../../helpers/json_reader.dart';

void main() {
  var testProjectModel = ProjectModel(
    pro_id: 'pro_id1',
    team_id: 'team_id1',
    name: 'name1',
    description: 'description1',
    created_at: DateTime(2020, 10, 10, 14, 58, 4),
    finished_at: DateTime(2020, 10, 10, 14, 58, 4),
    deleted_at: DateTime(2020, 10, 10, 14, 58, 4),
  );
  var testProject = Project(
    pro_id: 'pro_id1',
    team_id: 'team_id1',
    name: 'name1',
    description: 'description1',
    created_at: DateTime(2020, 10, 10, 14, 58, 4),
    finished_at: DateTime(2020, 10, 10, 14, 58, 4),
    deleted_at: DateTime(2020, 10, 10, 14, 58, 4),
  );

  test('should return a valid model from json', () async {
    Map<String, dynamic> jsonMap = json
        .decode(readJson('helpers/dummy_data/project/project_dummy_data.json'));

    var result = ProjectModel.fromJson(jsonMap);

    expect(result, equals(testProjectModel));
  });

  test('should return a json map containing proper data', () async {
    var result = testProjectModel.toJson();

    var expectedJsonMap = json
        .decode(readJson('helpers/dummy_data/project/project_dummy_data.json'));

    expect(result, equals(expectedJsonMap));
  });

  test('should return a valid entity from model', () async {
    var result = testProjectModel.toEntity();

    expect(result, equals(testProject));
  });
}
