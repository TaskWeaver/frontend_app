import 'package:flutter/material.dart';
import 'package:front/app/domain/presentation/login/component/checkbox_text_row.dart';
import 'package:front/app/domain/presentation/login/component/hinted_textfield.dart';
import 'package:front/app/domain/presentation/login/component/rounded_elvatedbutton.dart';

class EmailFormHandler {
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

  void updateAllAgreed() {
    allAgreed = personalInfoAgreed && termsAgreed;
  }

  bool validate() {
    return formKey.currentState?.validate() ?? false;
  }

  void save() {
    formKey.currentState?.save();
  }
}

class EmailSignInFormBuilderExampleScreen extends StatefulWidget {
  const EmailSignInFormBuilderExampleScreen({Key? key}) : super(key: key);

  @override
  State<EmailSignInFormBuilderExampleScreen> createState() => _EmailSignInFormBuilderExampleScreenState();
}

class _EmailSignInFormBuilderExampleScreenState extends State<EmailSignInFormBuilderExampleScreen> {
  final EmailFormHandler formHandler = EmailFormHandler();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formHandler.formKey,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  children: [
                    const Text('Form Demo'),
                    HintedTextField(
                      hintText: '아이디',
                      onSaved: (val) {
                        formHandler.id = val;
                      },
                      validator: formHandler.idValidator,
                    ),
                    HintedTextField(
                      hintText: '닉네임',
                      onSaved: (val) {
                        formHandler.nickName = val;
                      },
                      validator: formHandler.nickNameValidator,
                    ),
                    HintedTextField(
                      hintText: '비밀번호',
                      onChanged: (val) {
                        formHandler.confirmPassword = val;
                      },
                      onSaved: (val) {
                        formHandler.password = val;
                      },
                      validator: formHandler.passwordValidator,
                    ),
                    HintedTextField(
                      hintText: '비밀번호확인',
                      onSaved: (val) {
                        formHandler.confirmPassword = val;
                      },
                      validator: formHandler.confirmPasswordValidator,
                    ),
                    HintedTextField(
                      hintText: '이름',
                      onSaved: (val) {
                        formHandler.name = val;
                      },
                      validator: formHandler.nameValidator,
                    ),
                    HintedTextField(
                      hintText: '전화번호',
                      onSaved: (val) {
                        formHandler.phoneNumber = val;
                      },
                      validator: formHandler.phoneNumberValidator,
                    ),
                    CheckboxTextRow(
                      text: '모두 동의',
                      value: formHandler.allAgreed,
                      onChanged: (value) {
                        setState(() {
                          formHandler.allAgreed = value!;
                          formHandler.personalInfoAgreed = value;
                          formHandler.termsAgreed = value;
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
                          child: Column(
                            children: [
                              CheckboxTextRow(
                                value: formHandler.personalInfoAgreed,
                                onChanged: (value) {
                                  setState(() {
                                    formHandler.personalInfoAgreed = value!;
                                    formHandler.updateAllAgreed();
                                  });
                                },
                                text: '개인 정보 약관 동의',
                              ),
                              CheckboxTextRow(
                                value: formHandler.termsAgreed,
                                onChanged: (value) {
                                  setState(() {
                                    formHandler.termsAgreed = value!;
                                    formHandler.updateAllAgreed();
                                  });
                                },
                                text: '이용 약관 동의',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    RoundedElevatedButton(
                      text: '회원가입',
                      onPressed: onSignInPressed,
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onSignInPressed() {
    if (formHandler.validate() && formHandler.allAgreed) {
      formHandler.save();
      print(formHandler.id);
      print(formHandler.nickName);
      print(formHandler.confirmPassword);
      print(formHandler.password);
      print(formHandler.name);
      print(formHandler.phoneNumber);
    }
  }
}

