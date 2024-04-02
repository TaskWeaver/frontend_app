import 'package:dio/dio.dart';

import 'package:front/features/project/data/data_sources/remote_data_source.dart';
import 'package:front/features/project/data/data_sources/temp_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'riverpod.g.dart';

@riverpod
ProjectRemoteDataSource projectRemoteDataSource(
  ProjectRemoteDataSourceRef ref,
) {
  var dio = Dio();
  return ProjectRemoteDataSourceImpl(dio: dio);
}

@riverpod
ProjectTempDataSource projectTempDataSource(
  ProjectTempDataSourceRef ref,
) {
  return ProjectTempDataSource();
}
