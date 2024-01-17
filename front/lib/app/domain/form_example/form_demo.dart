import 'package:flutter/material.dart';
import 'package:front/app/domain/presentation/login/component/checkbox_text_row.dart';
import 'package:front/app/domain/presentation/login/component/rounded_elvatedbutton.dart';
import 'package:front/shared/atom/hinted_textfield.dart';
import 'package:front/shared/helper/helper.dart';
import 'package:front/shared/mixin/mixin.dart';

String passwordRegexPatternString = r'^(?=.*[a-zA-Z].*[a-zA-Z])(?=.*\d).{3,}$';

class EmailSignInFormBuilderExampleScreen extends StatefulWidget {
  const EmailSignInFormBuilderExampleScreen({Key? key}) : super(key: key);

  @override
  State<EmailSignInFormBuilderExampleScreen> createState() => _EmailSignInFormBuilderExampleScreenState();
}

class _EmailSignInFormBuilderExampleScreenState extends State<EmailSignInFormBuilderExampleScreen> with StateMapHandlerMixin {
  final FormHandler formHandler = FormHandler();

  @override
  Widget build(BuildContext context) {
    formHandler.init(stateMap, setStateMap);
    var id= formHandler.readValue('id', '');
    var nickname = formHandler.readValue('nickname', '');
    var password = formHandler.readValue('password', '');
    var passwordCheck = formHandler.readValue('passwordCheck', '');
    return Form(
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  children: [
                    const Text('Form Demo'),
                    Text('id is $id'),
                    Text('nickname is $nickname'),
                    Text('password is $password'),
                    Text('password check is $passwordCheck'),
                    HintedTextField(
                      hintText: '아이디',
                      value: formHandler.readValue('id', ''),
                      validator: formHandler.validateField('id', 
                          FieldValidationBuilder.field('id').required('id를 입력해주세요').build()
                      ),
                    ),
                    HintedTextField(
                      hintText: '닉네임',
                      value: formHandler.readValue('nickname', ''),
                      validator: formHandler.validateField('nickname', 
                          FieldValidationBuilder.field('nickname').required('닉네임을 입력해주세요').min(2, '2글자 이상 입력해주세요').build()
                      ),
                    ),
                    HintedTextField(
                      hintText: '비밀번호',
                      value: formHandler.readValue('password', ''),
                      validator: formHandler.validateField('password', 
                        FieldValidationBuilder.field('password').required('비밀번호를 입력해주세요').pattern(passwordRegexPatternString, '영어 대소문자, 숫자가 2개 이상 사용되어야 합니다.').build()
                      ),
                    ),
                    HintedTextField(
                      hintText: '비밀번호확인',
                      value: formHandler.readValue('passwordCheck', ''),
                      validator: formHandler.validateField('passwordCheck', 
                        FieldValidationBuilder.field('passwordCheck').required('비밀번호를 확인해주세요').sameAs(formHandler.readValue('password', ''), '비밀번호와 일치하지 않습니다.').build()
                      ),
                    ),
                    HintedTextField(
                      hintText: '이름',
                      value: formHandler.readValue('name', ''),
                      validator: formHandler.validateField('name', 
                        FieldValidationBuilder.field('name').build()
                      ),
                    ),
                    HintedTextField(
                      hintText: '전화번호',
                      value: formHandler.readValue('phoneNumber', ''),
                      validator: formHandler.validateField('phoneNumber', 
                        FieldValidationBuilder.field('phoneNumber').build()
                      ),
                    ),
                    CheckboxTextRow(
                      text: '모두 동의',
                      value: formHandler.readValue('allAgreed', false),
                      onChanged: formHandler.validateCheck('allAgreed', (fields) => {
                                  ...fields,
                                  'personalInfoAgreed': fields['allAgreed'],
                                  'termsAgreed': fields['allAgreed']
                                }
                                ),
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
                                value: formHandler.readValue('personalInfoAgreed', false),
                                onChanged: formHandler.validateCheck('personalInfoAgreed', (fields) => {
                                  ...fields,
                                  'allAgreed': fields['personalInfoAgreed'] && fields['termsAgreed']
                                }
                                ),
                                text: '개인 정보 약관 동의',
                              ),
                              CheckboxTextRow(
                                value: formHandler.readValue('termsAgreed', false),
                                onChanged: formHandler.validateCheck('termsAgreed', (fields) => {
                                  ...fields,
                                  'allAgreed': fields['personalInfoAgreed'] && fields['termsAgreed']
                                }
                                ),
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
                      onPressed: formHandler.onSubmit,
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
}
