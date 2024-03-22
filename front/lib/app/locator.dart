import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:front/app/di/team_di.dart';
import 'package:front/core/team/data/data_source/team_remote_data_source.dart';
import 'package:front/core/team/repositories/team_repository.dart';
import 'package:front/core/team/usecases/create_team_usecase.dart';
import 'package:front/core/team/usecases/get_team_by_id_usecase.dart';
import 'package:front/core/team/usecases/get_teams_use_case.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.I;
final teamRemoteDataSource = locator<TeamRemoteDataSource>();
final teamRepository = locator<TeamRepository>();
final getTeamUseCase = locator<GetTeamsUseCase>();
final createTeamUseCase = locator<CreateTeamUseCase>();
final getTeamByIdUseCase = locator<GetTeamByIdUseCase>();
final getStorage = locator<FlutterSecureStorage>();


initLocator() {
  TeamDependencyInjection().init();
}
