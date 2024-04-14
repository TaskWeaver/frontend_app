import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/app/locator.dart';
import 'package:front/features/user/data/models/sign_in_request.dart';
import 'package:front/features/user/data/models/token.dart';
import 'package:front/features/user/presentation/viewModel/sign_in_viewmodel.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  late final textController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Add form key

  String? _email; // Add variable to store entered username
  String? _password; // Add variable to store entered password
  bool _autoLogin = false; // Add variable to store checkbox value
  late SignInViewModel signInViewModel;

  @override
  void initState() {
    super.initState();
    signInViewModel = ref.read(signInViewModelProvider.notifier);
  }

  @override
  Widget build(BuildContext context) {
    var signInState = ref.watch(signInViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'TeamW2aver',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey, // Assign form key to the Form widget
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: '아이디',
                ),
                onChanged: (value) {
                  _email = value; // Store the entered value in the variable
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '아이디를 입력하세요.'; // Add validation error message
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: '비밀번호',
                ),
                onChanged: (value) {
                  _password = value; // Store the entered value in the variable
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '비밀번호를 입력하세요.'; // Add validation error message
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: _autoLogin,
                    onChanged: (value) {
                      setState(() {
                        _autoLogin = value ??
                            false; // Store the checkbox value in the variable
                      });
                    },
                  ),
                  const Text('자동 로그인'),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await signInViewModel.signIn(SignInRequest(
                      email: _email!,
                      password: _password!,
                    ));
                    await signInState.when(pending: () {
                      debugPrint('pending');
                    }, loading: () {
                      debugPrint('loading');
                    }, error: (e) {
                      debugPrint(e);
                    }, success: (value) async {
                      var token = TokenModel(
                          accessToken: value.accessToken,
                          refreshToken: value.refreshToken);
                      await saveTokenUseCase.call(token).then((value) {
                        tokenChangeNotifer.checkToken();
                      });

                      context.go('/myInfo');
                    }, failed: () {
                      debugPrint('failed');
                    });
                  }
                },
                child: const Text('Sign In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
