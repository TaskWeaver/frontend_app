import 'package:flutter/material.dart';
import 'package:front/domain/presentation/login/component/checkbox_text_row.dart';
import 'package:front/domain/presentation/login/component/customtextfield.dart';
import 'package:front/domain/presentation/login/component/RoundedElvatedButton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextStyle textStyle = const TextStyle(
    fontSize: 12,
    color: Colors.black,
  );
  String? id;
  String? password;
  bool? rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(children: [
              const Text("로그인"),
              const SizedBox(
                height: 20,
              ),
              HintedTextField(
                  title: "아이디",
                  hintText: "아이디를 입력하세요",
                  onSaved: (String? val) {
                    id = val;
                  },
                  validator: idValidator),
              HintedTextField(
                  title: "비밀번호",
                  hintText: "비밀번호를 입력하세요",
                  onSaved: (String? val) {
                    password = val;
                  },
                  validator: passwordValidator),
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
                text: "로그인",
                onPressed: () {},
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signIn');
                  },
                  child: Text("회원가입", style: textStyle)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text("아이디 찾기", style: textStyle),
                  ),
                  Text("|", style: textStyle),
                  TextButton(
                    onPressed: () {},
                    child: Text("비밀번호 찾기", style: textStyle),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Divider(
                  color: Colors.black,
                ),
              ),
              Text("SNS 로그인", style: textStyle),
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
    );
  }

  void onSaved() {}

  String? idValidator(String? val) {
    return null;
  }

  String? passwordValidator(String? val) {
    return null;
  }
}
