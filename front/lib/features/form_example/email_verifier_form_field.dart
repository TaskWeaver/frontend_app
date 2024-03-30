import 'package:flutter/material.dart';

import 'package:front/features/form_example/form_demo.dart';
import 'package:front/shared/atom/text_form_field.dart';
import 'package:front/shared/atom/timer_text_form_field.dart';
import 'package:front/shared/helper/FormHelper/form.dart';
import 'package:front/shared/helper/FormHelper/form_validate_builder.dart';
import 'package:front/shared/helper/FormHelper/interface/form_auto_validation_mode.dart';

class EmailVerifierFormField extends StatefulWidget {
  const EmailVerifierFormField({super.key});

  @override
  State<EmailVerifierFormField> createState() => _EmailVerifierFormFieldState();
}

class _EmailVerifierFormFieldState extends State<EmailVerifierFormField> {
  EmailAuthStatus _status = EmailAuthStatus.unauthenticated;
  var verificationCodeFieldVisiblity = false;
  var verificationButtonText = '이메일 인증';

  final inputDecoration = InputDecoration(
      border: InputBorder.none, filled: true, fillColor: Colors.grey[300]);

  void checkAuthenticationCode() {
    //TODO: check authentication code
    var form = CustomForm.maybeOf(context);

    if (form?.fields['emailVerificationCode']?.validate(null) == true) {
      setState(() {
        _status = EmailAuthStatus.authenticated;
        setVerificationCodeFieldVisiblity();
      });
    }
  }

  void startEmailAuthentication() {
    setState(() {
      _status = EmailAuthStatus.authenticating;
      setVerificationCodeFieldVisiblity();
    });
  }

  void setVerificationCodeFieldVisiblity() {
    switch (_status) {
      case EmailAuthStatus.authenticated:
        verificationCodeFieldVisiblity = false;
        verificationButtonText = '이메일 인증 완료';
        break;
      case EmailAuthStatus.unauthenticated:
        verificationCodeFieldVisiblity = true;
        verificationButtonText = '이메일 인증';
        break;
      case EmailAuthStatus.authenticating:
        verificationCodeFieldVisiblity = true;
        verificationButtonText = '이메일 인증 확인';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          fieldName: 'email',
          validator: FieldValidationBuilder.field('email')
              .required('이메일을 입력해주세요', AutoValidationMode.always)
              .build(),
          decoration: inputDecoration.copyWith(hintText: '이메일'),
        ),
        Visibility(
          visible: verificationCodeFieldVisiblity,
          child: TimerTextFormField(
            fieldName: 'emailVerificationCode',
            validator: FieldValidationBuilder.field('emailVerificationCode')
                .required('인증번호를 입력해주세요', AutoValidationMode.disabled)
                .customCheck(
                    (val) => true, //TODO: check authentication code
                    '인증코드가 일치하지 않습니다.',
                    AutoValidationMode.disabled)
                .build(),
            hintText: '인증번호 입력',
            duration: const Duration(minutes: 5),
          ),
        ),
        InkWell(
          onTap: () {
            //TODO: check email duplication
            switch (_status) {
              case EmailAuthStatus.authenticated:
                break;
              case EmailAuthStatus.unauthenticated:
                //TODO: check email duplication
                startEmailAuthentication();
                break;
              case EmailAuthStatus.authenticating:
                checkAuthenticationCode();
                break;
            }
          },
          child: Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white12,
              border: Border.all(width: 1, color: Colors.black),
            ),
            child: Center(child: Text(verificationButtonText)),
          ),
        ),
      ],
    );
  }
}
