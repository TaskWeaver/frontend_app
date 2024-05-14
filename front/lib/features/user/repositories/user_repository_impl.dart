import 'package:dartz/dartz.dart';
import 'package:front/core/config/custom_interceptor.dart';
import 'package:front/core/utils/failure.dart';
import 'package:front/features/user/data/data_source/local_data_source/user_local_data_source.dart';
import 'package:front/features/user/data/data_source/remote_data_source/user_remote_data_source.dart';
import 'package:front/features/user/data/models/change_password.dart';
import 'package:front/features/user/data/models/sign_in_request.dart';
import 'package:front/features/user/data/models/sign_in_response.dart';
import 'package:front/features/user/data/models/sign_up_request.dart';
import 'package:front/features/user/data/models/sign_up_response.dart';
import 'package:front/features/user/data/models/token.dart';
import 'package:front/features/user/data/models/user.dart';
import 'package:front/features/user/repositories/user_repositories.dart';

final class UserRepositoryImpl with ErrorHandler implements UserRepository {
  const UserRepositoryImpl({
    required UserRemoteDataSource userRemoteDataSource,
    required UserLocalDataSource userLocalDataSource,
  })  : _userRemoteDataSource = userRemoteDataSource,
        _userLocalDataSource = userLocalDataSource;

  final UserRemoteDataSource _userRemoteDataSource;
  final UserLocalDataSource _userLocalDataSource;

  @override
  Future<Either<Failure, void>> changePassword(
      ChangePassword changePassword) async {
    return catchError(() async {
      await _userRemoteDataSource.changePassword(changePassword);
    });
  }

  @override
  Future<Either<Failure, bool>> checkToken() {
    return catchError(() async {
      return _userLocalDataSource.checkToken();
    });
  }

  @override
  Future<Either<Failure, TokenModel>> getToken() {
    return catchError(() async {
      return await _userLocalDataSource.getToken();
    });
  }

  @override
  Future<Either<Failure, UserModel>> getUserInfo() {
    return catchError(() async {
      return await _userRemoteDataSource.getUserInfo();
    });
  }

  @override
  Future<Either<Failure, void>> saveToken(TokenModel token) {
    return catchError(() async {
      return await _userLocalDataSource.saveToken(token);
    });
  }

  @override
  Future<Either<Failure, SignInResponse>> signIn(SignInRequest signInRequest) {
    return catchError(() async {
      return await _userRemoteDataSource.signIn(signInRequest);
    });
  }

  @override
  Future<Either<Failure, void>> signOut() {
    return catchError(() async {
      await _userLocalDataSource.signOut();
    });
  }

  @override
  Future<Either<Failure, SignUpResponse>> signUp(SignUpRequest signUpRequest) {
    return catchError(() async {
      return await _userRemoteDataSource.signUp(signUpRequest);
    });
  }
}


// class ProjectRepositoryImpl with ErrorHandler implements ProjectRepository {
//   ProjectRepositoryImpl(
//       {required this.projectRemoteDataSource,
//       required this.projectTempDataSource});
//   final ProjectRemoteDataSource projectRemoteDataSource;
//   final ProjectTempDataSource projectTempDataSource;

//   Map<int, Project> projects = {};

//   @override
//   Future<Either<Failure, List<Project>>> getProjectsByTeamId(int teamId) async {
//     return catchError(() async {
//       var result = await projectRemoteDataSource.getProjectsByTeamId(teamId);
//       for (var element in result) {
//         projects.addAll({element.projectId: element.toEntity()});
//       }
//       return result.map((e) => e.toEntity()).toList();
//     });
//   }

//   @override
//   Future<Either<Failure, Project>> getProjectById(int projectId) async {
//     return catchError(() async {
//       var result = await projectRemoteDataSource.getProjectById(projectId);
//       projects.addAll({projectId: result.toEntity()});
//       return projects[projectId]!;
//     });
//   }

//   @override
//   Future<Either<Failure, void>> deleteProjectById(int projectId) async {
//     return catchError(() async {
//       await projectRemoteDataSource.deleteProjectById(projectId);
//       projects.remove(projectId);
//     });
//   }

//   @override
//   Future<Either<Failure, Project>> updateProjectById(
//       Project project, int projectId) async {
//     return catchError(() async {
//       await projectRemoteDataSource.updateProjectById(
//           ProjectRequestModel.fromEntity(project), projectId);
//       projects.addAll({projectId: project});
//       return project;
//     });
//   }

//   @override
//   Future<Either<Failure, Project>> createProject(
//       ProjectRequestModel project, int teamId) async {
//     return catchError(() async {
//       var result = await projectRemoteDataSource.createProject(project, teamId);
//       projects.addAll({result.projectId: result.toEntity()});
//       return result.toEntity();
//     });
//   }
// }
