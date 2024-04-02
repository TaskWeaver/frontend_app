import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:front/features/project/data/models/project_request.dart';

import '../../../helpers/json_reader.dart';

void main() {
  var testProjectRequestModel = const ProjectRequestModel(
    name: 'name1',
    description: 'description1',
    managerId: 2,
  );

  test('should return a valid model from json', () async {
    Map<String, dynamic> jsonMap = json.decode(
        readJson('helpers/dummy_data/project/project_request_dummy_data.json'));

    var result = ProjectRequestModel.fromJson(jsonMap);

    expect(result, equals(testProjectRequestModel));
  });

  test('should return a json map containing proper data', () async {
    var result = testProjectRequestModel.toJson();

    var expectedJsonMap = json.decode(
        readJson('helpers/dummy_data/project/project_request_dummy_data.json'));

    expect(result, equals(expectedJsonMap));
  });
}
