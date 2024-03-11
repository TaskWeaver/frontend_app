import 'package:dartz/dartz.dart';
import 'package:front/core/team/data/remote_data_source.dart';
import 'package:front/core/team/domain/entities/team.dart';
import 'package:front/core/team/domain/repositories/team_repository.dart';
import 'package:front/core/utils/failure.dart';

class TeamRepositoryImpl implements TeamRepository {
  final TeamRemoteDataSource teamRemoteDataSource;

  TeamRepositoryImpl({
    required this.teamRemoteDataSource,
  });

  @override
  Future<Either<Failure, Team>> getTeamById(int teamId) async {
    throw UnimplementedError();
  }

  @override
  Future postTeam(String name) {
    // TODO: implement postTeam
    throw UnimplementedError();
  }
}
