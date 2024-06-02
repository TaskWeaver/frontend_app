import 'package:dio/dio.dart';
import 'package:front/core/utils/exception.dart';
import 'package:front/features/user/data/data_source/remote_data_source/user_remote_data_source.dart';
import 'package:front/features/user/data/models/change_password_model.dart';
import 'package:front/features/user/data/models/sign_in_request_model.dart';
import 'package:front/features/user/data/models/sign_in_response_model.dart';
import 'package:front/features/user/data/models/sign_up_request_model.dart';
import 'package:front/features/user/data/models/sign_up_response_model.dart';
import 'package:front/features/user/data/models/user_model.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  UserRemoteDataSourceImpl({required this.dio});
  final Dio dio;

  @override
  Future<void> changePassword(ChangePasswordModel changePassword) {
    return dio
        .post(
          '/v1/user/password',
          data: changePassword.toJson(),
          options: Options(
            headers: {
              'accessToken': 'true',
            },
          ),
        )
        .then((_) => null);
  }

  @override
  Future<UserModel> getUserInfo() {
    try {
      return dio
          .get(
        '/v1/user',
        options: Options(
          headers: {
            'accessToken': 'true',
          },
        ),
      )
          .then((response) {
        if (response.statusCode == 200 && response.data?['resultCode'] == 200) {
          return UserModel.fromJson(response.data['result']);
        } else {
          throw ServerException();
        }
      });
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<SignInResponseModel> signIn(SignInRequestModel signInRequest) {
    try {
      return dio
          .post(
        '/v1/auth/sign-in',
        data: signInRequest.toJson(),
        options: Options(
          headers: {
            'accessToken': 'false',
          },
        ),
      )
          .then((response) {
        if (response.statusCode == 200 && response.data?['resultCode'] == 200) {
          return SignInResponseModel.fromJson(response.data['result']);
        } else {
          throw ServerException();
        }
      });
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<SignUpResponseModel> signUp(SignUpRequestModel signUpRequest) {
    try {
      return dio
          .post(
        '/v1/auth/sign-up',
        data: signUpRequest.toJson(),
        options: Options(
          headers: {
            'accessToken': 'true',
          },
        ),
      )
          .then((response) {
        if (response.statusCode == 201 && response.data?['resultCode'] == 201) {
          return SignUpResponseModel.fromJson(response.data['result']);
        } else {
          throw ServerException();
        }
      });
    } on DioException {
      rethrow;
    }
  }

  // @override
  // Future<List<ProjectModel>> getProjectsByTeamId(int teamId) async {
  //   try {
  //     debugPrint('teamId: $teamId');
  //     var response = await dio.get(
  //       '/v1/team/$teamId/projects',
  //       options: Options(
  //         headers: {
  //           'accessToken': 'true',
  //         },
  //       ),
  //     );

  //     if (response.statusCode == 200 && response.data?['resultCode'] == 200) {
  //       debugPrint(response.data['result'].toString());
  //       return response.data['result']
  //           .map<ProjectModel>((data) => ProjectModel.fromJson(data))
  //           .toList();
  //     } else {
  //       throw ServerException();
  //     }
  //   } on DioException {
  //     rethrow;
  //   }
  // }

  // @override
  // Future<ProjectModel> getProjectById(int projectId) async {
  //   try {
  //     var response = await dio.get(
  //       '/v1/project/$projectId',
  //       options: Options(
  //         headers: {
  //           'accessToken': 'true',
  //         },
  //       ),
  //     );

  //     if (response.statusCode == 200 && response.data?['resultCode'] == 200) {
  //       return ProjectModel.fromJson(response.data['result']);
  //     } else {
  //       throw ServerException();
  //     }
  //   } on DioException {
  //     rethrow;
  //   }
  // }

  // @override
  // Future<ProjectModel> createProject(
  //     ProjectRequestModel project, int teamId) async {
  //   try {
  //     var response = await dio.post(
  //       '/v1/team/$teamId/project',
  //       data: project.toJson(),
  //       options: Options(
  //         headers: {
  //           'accessToken': 'true',
  //         },
  //       ),
  //     );
  //     if (response.statusCode == 201 && response.data?['resultCode'] == 201) {
  //       return ProjectModel.fromJson(response.data['result']);
  //     } else {
  //       throw ServerException();
  //     }
  //   } on DioException {
  //     rethrow;
  //   }
  // }

  // @override
  // Future<void> deleteProjectById(int projectId) async {
  //   try {
  //     var response = await dio.delete(
  //       '/v1/project/$projectId',
  //       options: Options(
  //         headers: {
  //           'accessToken': 'true',
  //         },
  //       ),
  //     );

  //     if (response.statusCode == 200 && response.data?['resultCode'] == 200) {
  //       return;
  //     } else {
  //       throw ServerException();
  //     }
  //   } on DioException {
  //     rethrow;
  //   }
  // }

  // @override
  // Future<ProjectRequestModel> updateProjectById(
  //     ProjectRequestModel project, int projectId) async {
  //   try {
  //     var response = await dio.patch(
  //       '/v1/project/$projectId',
  //       data: project.toJson(),
  //       options: Options(
  //         headers: {
  //           'accessToken': 'true',
  //         },
  //       ),
  //     );

  //     if (response.statusCode == 204 && response.data?['resultCode'] == 204) {
  //       return project;
  //     } else {
  //       throw ServerException();
  //     }
  //   } on DioException {
  //     rethrow;
  //   }
  // }
}
