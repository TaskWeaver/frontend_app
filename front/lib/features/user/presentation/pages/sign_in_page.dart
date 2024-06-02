import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/features/user/data/models/sign_in_request_model.dart';
import 'package:front/features/user/data/models/token_model.dart';
import 'package:front/features/user/presentation/viewModel/sign_in_viewmodel.dart';
import 'package:front/resources/resources.dart';
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
  // Add variable to store checkbox value
  late SignInViewModel signInViewModel;

  @override
  void initState() {
    super.initState();
    signInViewModel = ref.read(signInViewModelProvider.notifier);
  }

  @override
  Widget build(BuildContext context) {
    var signInState = ref.watch(signInViewModelProvider);
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Form(
              key: _formKey, // Assign form key to the Form widget
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 32),
                    logo(),
                    const SizedBox(height: 32),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: '아이디',
                      ),
                      onChanged: (value) {
                        _email =
                            value; // Store the entered value in the variable
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
                        _password =
                            value; // Store the entered value in the variable
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '비밀번호를 입력하세요.'; // Add validation error message
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await signInViewModel.signIn(SignInRequestModel(
                            email: _email!,
                            password: _password!,
                          ));

                          signInState = ref.watch(signInViewModelProvider);
                          signInState.whenOrNull(
                            data: (value) {
                              var token = TokenModel(
                                  accessToken: value.accessToken,
                                  refreshToken: value.refreshToken);
                              signInViewModel.saveToken(token).then((value) {
                                context.go('/team');
                              });
                            },
                          );
                        }
                      },
                      child: signInState.whenOrNull(
                        loading: () => const CircularProgressIndicator(),
                        data: (_) => const Text('로그인'),
                        error: (error, _) => Text('Error: $error'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget logo() {
    return Container(
      child: Image.asset(Images.onbordingIcon),
    );
  }
}
