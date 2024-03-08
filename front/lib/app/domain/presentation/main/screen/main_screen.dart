import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/app/domain/presentation/main/viewModel/main_screen_viewmodel.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  late MainScreenViewModel viewmodel;

  Future<void> fetchUserData(MainScreenViewModel mainScreenViewModel) async {
    try {
      await mainScreenViewModel.getRemoteUserInfo();
    } catch (e) {
      print('서버에서 정보를 받아오기를 실패하였습니다. \n errormessage: $e \n 로컬의 정보를 받아옵니다.');
      try {
        await mainScreenViewModel.getLocalUserInfo();
      } catch (e) {
        print('로컬에서의 정보를 받아오는 것을 실패했습니다. 에러: $e');
      }
    }
  }

  @override
  void initState() {
    viewmodel = ref.read(mainScreenViewModelProvider.notifier);
    super.initState();
    fetchUserData(viewmodel);
  }

  @override
  Widget build(BuildContext context) {
    var mainScreenViewModelState = ref.watch(mainScreenViewModelProvider);
    var mainScreenViewModel = ref.read(mainScreenViewModelProvider.notifier);

    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: mainScreenViewModelState.when(
            data: (data) => data == null
                ? const CircularProgressIndicator()
                : Column(
                    children: [
                      // userModel이 null일 때 에러 처리가 필요하다면, data 자체가 null인지 체크하면 됩니다.
                      Text(
                        'Hello, ${data.email}!', // data.userModel!.name에서 수정됨
                      ),
                      ElevatedButton(
                          onPressed: () {
                            mainScreenViewModel.signOut();
                          },
                          child: const Text('로그아웃'))
                    ],
                  ),
            loading: () => const CircularProgressIndicator(),
            error: (error, stack) => Text('Error: $error'),
          ),
        ));
  }
}
