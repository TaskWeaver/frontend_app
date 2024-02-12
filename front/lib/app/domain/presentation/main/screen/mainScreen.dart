import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/app/domain/presentation/main/viewModel/mainScreenViewModel.dart';
import 'package:front/core/Auth/user_login_state_notifier.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  @override
  Widget build(BuildContext context) {
    var mainScreenViewModel = ref.watch(mainScreenViewModelProvider);
    var loginStateNotifer = ref.watch(userLoginStateProvider.notifier);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: mainScreenViewModel.when(
          data: (data) => Column(
            children: [
              Text(data.userModel.id.toString()),
              Text(data.userModel.email),
              Text(data.userModel.nickname!),
              Text(data.userModel.type),
              ElevatedButton(
                  onPressed: () {
                    loginStateNotifer.logout();
                  },
                  child: const Text('로그아웃'))
            ],
          ),
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text('Error: $error'),
        ),
      ),
    );
  }
}
