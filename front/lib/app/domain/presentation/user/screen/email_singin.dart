import 'package:flutter/material.dart';
import 'package:front/app/domain/presentation/user/component/checkbox_text_row.dart';
import 'package:front/app/domain/presentation/user/component/hinted_textfield.dart';
import 'package:front/app/domain/presentation/user/component/rounded_elvatedbutton.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class EmailSignInScreen extends StatefulWidget {
  const EmailSignInScreen({super.key});

  @override
  State<EmailSignInScreen> createState() => _EmailSignInScreenState();
}

class _EmailSignInScreenState extends State<EmailSignInScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? id;
  String? nickName;
  String? confirmPassword;
  String? password;
  String? name;
  String? phoneNumber;
  bool personalInfoAgreed = false;
  bool termsAgreed = false;
  bool allAgreed = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  children: [
                    const Text('회원가입'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 100, // 원의 너비
                        height: 100, // 원의 높이
                        decoration: BoxDecoration(
                          shape: BoxShape.circle, // 동그라미 모양
                          color: Colors.grey[300], // 회색
                        ),
                        child: const Center(child: Text('이미지')),
                      ),
                    ),
                    HintedTextField(
                      hintText: '아이디',
                      onSaved: (val) {
                        id = val;
                      },
                      validator: idValidator,
                    ),
                    HintedTextField(
                      hintText: '닉네임',
                      onSaved: (val) {
                        nickName = val;
                      },
                      validator: nickNameValidator,
                    ),
                    HintedTextField(
                      hintText: '비밀번호',
                      onChanged: (val) {
                        confirmPassword = val;
                      },
                      onSaved: (val) {
                        password = val;
                      },
                      validator: passwordValidator,
                    ),
                    HintedTextField(
                      hintText: '비밀번호확인',
                      onSaved: (val) {
                        confirmPassword = val;
                      },
                      validator: confirmPasswordValidator,
                    ),
                    HintedTextField(
                      hintText: '이름',
                      onSaved: (val) {
                        name = val;
                      },
                      validator: nameValidator,
                    ),
                    HintedTextField(
                      hintText: '전화번호',
                      onSaved: (val) {
                        phoneNumber = val;
                      },
                      validator: phoneNumberValidator,
                    ),
                    CheckboxTextRow(
                      text: '모두 동의',
                      value: allAgreed,
                      onChanged: (value) {
                        setState(() {
                          allAgreed = value!;
                          personalInfoAgreed = value;
                          termsAgreed = value;
                        });
                      },
                    ),
                    Expanded(
                      flex: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Column(children: [
                            CheckboxTextRow(
                              value: personalInfoAgreed,
                              onChanged: (value) {
                                setState(() {
                                  personalInfoAgreed = value!;
                                  updateAllAgreed();
                                });
                              },
                              text: '개인 정보 약관 동의',
                            ),
                            CheckboxTextRow(
                              value: termsAgreed,
                              onChanged: (value) {
                                setState(() {
                                  termsAgreed = value!;
                                  updateAllAgreed();
                                });
                              },
                              text: '이용 약관 동의',
                            ),
                          ]),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RoundedElevatedButton(
                      text: '회원가입',
                      onPressed: onSingInPressed,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void updateAllAgreed() {
    setState(() {
      allAgreed = personalInfoAgreed && termsAgreed;
    });
  }

  String? idValidator(String? val) {
    if (val == null || val.isEmpty) {
      return 'ID를 입력해주세요';
    }
    return null;
  }

  String? nickNameValidator(String? val) {
    if (val == null || val.isEmpty) {
      return '닉네임을 입력해주세요';
    }
    return null;
  }

  String? passwordValidator(String? val) {
    if (val == null || val.isEmpty) {
      return '비밀번호를 입력해주세요';
    }
    return null;
  }

  String? confirmPasswordValidator(String? val) {
    if (val == null || val.isEmpty) {
      return '비밀번호를 입력해주세요';
    }
    if (val != confirmPassword) {
      return '비밀번호가 일치하지 않습니다';
    }
    return null;
  }

  String? nameValidator(String? val) {
    if (val == null || val.isEmpty) {
      return '이름을 입력해주세요';
    }
    return null;
  }

  String? phoneNumberValidator(String? val) {
    if (val == null || val.isEmpty) {
      return '전화번호를 입력해주세요';
    }
    return null;
  }

  onSingInPressed() {
    if (formKey.currentState!.validate() && allAgreed == true) {
      formKey.currentState!.save();
      print(id);
      print(nickName);
      print(confirmPassword);
      print(password);
      print(name);
      print(phoneNumber);
    }
  }
}

@widgetbook.UseCase(
  name: '',
  type: EmailSignInScreen,
)
Widget loginScreenUseCase(BuildContext context) {
  return const EmailSignInScreen();
}