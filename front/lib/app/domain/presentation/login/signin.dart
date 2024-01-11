import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(
      fontSize: 12,
      color: Colors.black,
    );
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(children: [
              Text(
                '회원가입',
                style: textStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '회원가입 방식을 선택해주세요',
                style: textStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton('이메일로 회원가입', () {
                Navigator.pushNamed(context, '/emailSignIn'); // 로그인 화면으로 이동
              }),
              CustomButton('카카오로 회원가입', () {}),
              CustomButton('네이버로 회원가입', () {}),
            ]),
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton(this.buttonText, this.onPressed, {super.key});
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[300],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            buttonText,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

@widgetbook.UseCase(
  name: '',
  type: SignInScreen,
)
Widget loginScreenUseCase(BuildContext context) {
  return const SignInScreen();
}