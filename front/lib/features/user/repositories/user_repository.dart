import 'package:dartz/dartz.dart';
import 'package:front/core/utils/failure.dart';
import 'package:front/features/user/data/models/change_password.dart';
import 'package:front/features/user/data/models/sign_in_request.dart';
import 'package:front/features/user/data/models/sign_in_response.dart';
import 'package:front/features/user/data/models/sign_up_request.dart';
import 'package:front/features/user/data/models/sign_up_response.dart';
import 'package:front/features/user/data/models/token.dart';
import 'package:front/features/user/data/models/user.dart';

abstract class UserRepository {
  Future<Either<Failure, UserModel>> getUserInfo();

  Future<Either<Failure, void>> changePassword(ChangePassword changePassword);

  Future<Either<Failure, SignUpResponse>> signUp(SignUpRequest signUpRequest);
  Future<Either<Failure, SignInResponse>> signIn(SignInRequest signInRequest);
  Future<Either<Failure, void>> signOut();

  /// setAutoSignInCheck == true && tokenCheck == true 가 만족해야 autoSignIn 가능
  // Future<Either<Failure, bool>> autoSignInCheck();

  Future<Either<Failure, void>> saveToken(TokenModel token);
  Future<Either<Failure, TokenModel>> getToken();

  Future<Either<Failure, bool>> checkToken();
}


// import 'package:dartz/dartz.dart';
// import 'package:front/core/utils/failure.dart';
// import 'package:front/features/project/data/models/project_request.dart';
// import 'package:front/features/project/entities/project.dart';

// abstract class ProjectRepository {
//   Future<Either<Failure, List<Project>>> getProjectsByTeamId(int teamId);
//   Future<Either<Failure, Project>> getProjectById(int projectId);
//   Future<Either<Failure, Project>> updateProjectById(
//       Project project, int projectId);
//   Future<Either<Failure, Project>> createProject(
//       ProjectRequestModel project, int teamId);
//   Future<Either<Failure, void>> deleteProjectById(int projectId);
// }
