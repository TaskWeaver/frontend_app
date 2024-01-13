import 'package:flutter/material.dart';
import 'package:front/app/domain/presentation/login/component/checkbox_text_row.dart';
import 'package:front/app/domain/presentation/login/component/rounded_elvatedbutton.dart';
import 'package:front/shared/atom/hinted_textfield.dart';
import 'package:front/shared/helper/helper.dart';
import 'package:front/shared/mixin/mixin.dart';

class EmailSignInFormBuilderExampleScreen extends StatefulWidget {
  const EmailSignInFormBuilderExampleScreen({Key? key}) : super(key: key);

  @override
  State<EmailSignInFormBuilderExampleScreen> createState() => _EmailSignInFormBuilderExampleScreenState();
}

class _EmailSignInFormBuilderExampleScreenState extends State<EmailSignInFormBuilderExampleScreen> with StateHandlerMixin {
  final FormHandler formHandler = FormHandler();

  @override
  Widget build(BuildContext context) {
    formHandler.init(setStateHandler);
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
                      validator: formHandler.validateField('id', 
                          FieldValidateBuilder(emtpyMessage: 'id를 입력해주세요')
                      ),
                    ),
                    HintedTextField(
                      hintText: '닉네임',
                       validator: formHandler.validateField('nickname', 
                          FieldValidateBuilder(emtpyMessage: 'nickname을 입력해주세요')
                      ),
                    ),
                    HintedTextField(
                      hintText: '비밀번호',
                      validator: formHandler.validateField('password', 
                        FieldValidateBuilder(emtpyMessage: 'password를 입력해주세요')
                      ),
                    ),
                    HintedTextField(
                      hintText: '비밀번호확인',
                      validator: formHandler.validateField('passwordCheck', 
                          FieldValidateBuilder(emtpyMessage: 'password를 입력해주세요')
                      ),
                    ),
                    HintedTextField(
                      hintText: '이름',
                      validator: formHandler.validateField('name', 
                          FieldValidateBuilder(emtpyMessage: 'name을 입력해주세요')
                      ),
                    ),
                    HintedTextField(
                      hintText: '전화번호',
                      validator: formHandler.validateField('phoneNumber', 
                          FieldValidateBuilder(emtpyMessage: 'phoneNumber을 입력해주세요')
                      ),
                    ),
                    CheckboxTextRow(
                      text: '모두 동의',
                      value: formHandler.readValue('allAgreed', false),
                      onChanged: formHandler.validateCheck('allAgreed', (fields) {
                          formHandler.updateField('personalInfoAgreed',fields['allAgreed']);
                          formHandler.updateField('termsAgreed',fields['allAgreed']);
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
                                onChanged: formHandler.validateCheck('personalInfoAgreed', (fields) => 
                                   formHandler.updateField('allAgreed',fields['personalInfoAgreed'] && fields['termsAgreed']
                                  )
                                ),
                                text: '개인 정보 약관 동의',
                              ),
                              CheckboxTextRow(
                                value: formHandler.readValue('termsAgreed', false),
                                onChanged: formHandler.validateCheck('termsAgreed', (fields) => 
                                   formHandler.updateField('allAgreed',fields['personalInfoAgreed'] && fields['termsAgreed']
                                  )
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
    if (formHandler.validateFieldForm() && formHandler.readValue('allAgreed', false)) {
      formHandler.onSubmit();
    }
  }
}

