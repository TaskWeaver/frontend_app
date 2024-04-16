import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:front/core/const/enum.dart';
import 'package:front/features/project/data/models/project_model.dart';
import 'package:front/features/project/entities/project_entity.dart';

import '../../../helpers/json_reader.dart';

void main() {
  var testProjectModel = ProjectModel(
    projectId: 1,
    name: 'name1',
    description: 'description1',
    managerId: 2,
    projectState: 'BEFORE',
  );
  var testProject = Project(
    projectId: 1,
    name: 'name1',
    description: 'description1',
    managerId: 2,
    projectState: ProjectStateEnum.before,
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
