import 'package:front/app/locator.dart';
import 'package:front/core/network_handling/app_dio.dart';
import 'package:front/features/user/data/data_source/local_data_source/user_local_data_source.dart';
import 'package:front/features/user/data/data_source/local_data_source/user_local_data_source_impl.dart';
import 'package:front/features/user/data/data_source/remote_data_source/user_remote_data_source.dart';
import 'package:front/features/user/data/data_source/remote_data_source/user_remote_data_source_impl.dart';
import 'package:front/features/user/presentation/providers/user_controller.dart';
import 'package:front/features/user/repositories/user_repository.dart';
import 'package:front/features/user/repositories/user_repository_impl.dart';
import 'package:front/features/user/usecase/change_password_usecase.dart';
import 'package:front/features/user/usecase/check_token_usecase.dart';
import 'package:front/features/user/usecase/get_token_usecase.dart';
import 'package:front/features/user/usecase/get_user_info_usecase.dart';
import 'package:front/features/user/usecase/save_token_usecase.dart';
import 'package:front/features/user/usecase/sign_in_usecase.dart';
import 'package:front/features/user/usecase/sign_out_usecase.dart';
import 'package:front/features/user/usecase/sign_up_usecase.dart';

class UserDependencyInjection {
  void init() {
    dataSources();
    repositories();
    useCases();
    setupLocator();
  }

  void dataSources() {
    locator.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(
        dio: AppDio.instance,
      ),
    );
    locator.registerLazySingleton<UserLocalDataSource>(
      () => UserLocalDataSourceImpl(
          flutterSecureStorage: secureStorage,
          sharedPreferences: sharedPreferences),
    );
  }

  void repositories() {
    locator.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(
        userRemoteDataSource: userRemoteDataSource,
        userLocalDataSource: userLocalDataSource,
      ),
    );
  }

  void useCases() {
    locator.registerFactory<SignInUseCase>(
      () => SignInUseCase(userRepository),
    );

    locator.registerFactory<SignUpUseCase>(
      () => SignUpUseCase(userRepository),
    );
    locator.registerFactory<GetUserInfoUseCase>(
      () => GetUserInfoUseCase(userRepository),
    );
    // locator.registerFactory<AutoSignInCheckUseCase>(
    //   () => AutoSignInCheckUseCase(userRepository),
    // );
    locator.registerFactory<SignOutUseCase>(
      () => SignOutUseCase(userRepository),
    );
    locator.registerFactory<ChangePasswordUseCase>(
      () => ChangePasswordUseCase(userRepository),
    );
    // locator.registerFactory<SetAutoSignInTrueUseCase>(
    //   () => SetAutoSignInTrueUseCase(userRepository),
    // );
    // locator.registerFactory<SetAutoSignInFalseUseCase>(
    //   () => SetAutoSignInFalseUseCase(userRepository),
    // );
    locator.registerFactory<GetTokenUseCase>(
      () => GetTokenUseCase(userRepository),
    );
    locator.registerFactory<SaveTokenUseCase>(
        () => SaveTokenUseCase(userRepository));

    locator.registerFactory<CheckTokenUseCase>(
      () => CheckTokenUseCase(userRepository),
    );
  }

  void setupLocator() {
    locator.registerLazySingleton<AuthController>(
      () => AuthController(),
    );
  }
}
