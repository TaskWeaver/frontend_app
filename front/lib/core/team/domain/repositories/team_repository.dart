import 'package:dartz/dartz.dart';
import 'package:front/core/team/domain/entities/team.dart';
import 'package:front/core/utils/failure.dart';

abstract class TeamRepository {
  Future<Either<Failure, Team>> getTeamById(int teamId);
  Future postTeam(String name);
  // Future<Either<Failure, Team>> postTeam(String name);

}