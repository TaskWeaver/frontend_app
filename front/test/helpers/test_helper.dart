import 'package:front/features/project/data/data_sources/remote_data_source.dart';
import 'package:front/features/project/repositories/project_repository.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks(
  [
    ProjectRepository,
    ProjectRemoteDataSource,
  ],
)
void main() {}
