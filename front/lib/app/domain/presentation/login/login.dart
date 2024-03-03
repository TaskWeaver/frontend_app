import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/app/domain/presentation/login/component/checkbox_text_row.dart';
import 'package:front/app/domain/presentation/login/component/rounded_elvatedbutton.dart';
import 'package:front/app/domain/presentation/login/viewmodel/login_view_model.dart';
import 'package:front/shared/atom/text_form_field.dart';
import 'package:front/shared/helper/FormHelper/form.dart';
import 'package:front/shared/helper/FormHelper/form_validate_builder.dart';
import 'package:front/shared/helper/FormHelper/interface/form_auto_validation_mode.dart';
import 'package:go_router/go_router.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

String passwordRegexPatternString = r'^(?=.*[a-zA-Z].*[a-zA-Z])(?=.*\d).{3,}$';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextStyle textStyle = const TextStyle(
    fontSize: 12,
    color: Colors.black,
  );
  final _formKey = GlobalKey<CustomFormState>();
  final inputDecoration = InputDecoration(
      border: InputBorder.none, filled: true, fillColor: Colors.grey[300]);

  String? id;
  String? password;
  bool? rememberMe = false;
  late CustomFormState? currentState;
  late AsyncValue<dynamic> state;
  late LoginScreenViewModel loginScreenViewModel;

  @override
  void initState() {
    super.initState();

    currentState = _formKey.currentState;
  }

  void onFormChanged() {
    setState(() {
      currentState = _formKey.currentState;
    });
  }

  @override
  Widget build(BuildContext context) {
    state = ref.watch(loginScreenViewModelProvider);
    loginScreenViewModel = ref.read(loginScreenViewModelProvider.notifier);
    return CustomForm(
      key: _formKey,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(children: [
                  const Text('로그인'),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    fieldName: 'email',
                    validator: FieldValidationBuilder.field('email')
                        .required(
                            '이메일을 입력하세요', AutoValidationMode.onUserInteraction)
                        .build(),
                    decoration: inputDecoration.copyWith(
                      hintText: '이메일',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    fieldName: 'password',
                    validator: FieldValidationBuilder.field('password')
                        .required('비밀번호를 입력해주세요',
                            AutoValidationMode.onUserInteraction)
                        .pattern(
                            passwordRegexPatternString,
                            '영어 대소문자, 숫자가 2개 이상 사용되어야 합니다.',
                            AutoValidationMode.onUserInteraction)
                        .build(),
                    decoration: inputDecoration.copyWith(
                      hintText: '비밀번호',
                    ),
                  ),
                  CheckboxTextRow(
                    text: '자동로그인',
                    value: rememberMe!,
                    onChanged: (value) {
                      setState(() {
                        rememberMe = value;
                      });
                    },
                  ),
                  RoundedElevatedButton(
                    text: '로그인',
                    onPressed: _onLoginButtonPressed,
                  ),
                  TextButton(
                      onPressed: () {
                        context.go('/signup');
                      },
                      child: Text('회원가입', style: textStyle)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text('아이디 찾기', style: textStyle),
                      ),
                      Text('|', style: textStyle),
                      TextButton(
                        onPressed: () {},
                        child: Text('비밀번호 찾기', style: textStyle),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  Text('SNS 로그인', style: textStyle),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50, // 원의 너비
                        height: 50, // 원의 높이
                        decoration: BoxDecoration(
                          shape: BoxShape.circle, // 동그라미 모양
                          color: Colors.grey[300], // 회색
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 50, // 원의 너비
                        height: 50, // 원의 높이
                        decoration: BoxDecoration(
                          shape: BoxShape.circle, // 동그라미 모양
                          color: Colors.grey[300], // 회색
                        ),
                      ),
                    ],
                  )
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onLoginButtonPressed() async {
    var email = _formKey.currentState?.fields['email']?.value;
    var password = _formKey.currentState?.fields['password']?.value;

    if (_formKey.currentState?.validate(null) == true) {
      try {
        await loginScreenViewModel.signInByEmail(email!, password!);
        context.go('/main');
        // 로그인 성공 후의 로직
      } catch (e) {
        print('로그인 프로세스 중 에러 발생: $e');
        // 에러 처리 로직 (예: Snackbar 띄우기)
      }
    }
  }
}

@widgetbook.UseCase(
  name: '',
  type: LoginScreen,
)
Widget loginScreenUseCase(BuildContext context) {
  return const LoginScreen();
}
