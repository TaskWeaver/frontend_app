import 'package:front/core/user/models/user.dart';
import 'package:front/core/user/user_login_state_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mainScreenViewModel.g.dart';

class MainScreenViewModel {
  MainScreenViewModel({required this.userModel});
  final UserModel userModel;
  //final Todo todo;
  //UserInfo 를 받아옴
}

@riverpod
Future<MainScreenViewModel> mainScreenViewModel(
    MainScreenViewModelRef ref) async {
  //userInfo 를 받아오는 함수
  var userModel = await ref.read(userLoginStateProvider.notifier).getMe();
  print(userModel);
  if (userModel == null) {
    throw Exception('userInfo is null');
  }
  var mainScreenViewModel = MainScreenViewModel(userModel: userModel);

  return mainScreenViewModel;
}
