import 'package:flutter/material.dart';
import 'package:front/app/domain/form_example/form_demo.dart';
import 'package:front/i18n/strings.g.dart';
import 'package:front/shared/atom/text_form_field.dart';
import 'package:front/shared/atom/timer_text_form_field.dart';
import 'package:front/shared/helper/FormHelper/form.dart';
import 'package:front/shared/helper/FormHelper/form_validate_builder.dart';
import 'package:front/shared/helper/FormHelper/interface/form_auto_validation_mode.dart';

class EmailVerifierFormField extends StatefulWidget {
  const EmailVerifierFormField({super.key, required this.strings});
  final Translations strings;

  @override
  State<EmailVerifierFormField> createState() => _EmailVerifierFormFieldState();
}

class _EmailVerifierFormFieldState extends State<EmailVerifierFormField> {
  _EmailVerifierFormFieldState();

  late Translations strings;
  late String verificationButtonText;
  @override
  void initState() {
    super.initState();
    strings = widget.strings;
    verificationButtonText =
        strings.emailVerifierFormfieldScreen.verificationButton.unauthenticated;
  }

  EmailAuthStatus _status = EmailAuthStatus.unauthenticated;

  var verificationCodeFieldVisiblity = false;

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
        verificationButtonText = strings
            .emailVerifierFormfieldScreen.verificationButton.authenticated;
        break;
      case EmailAuthStatus.unauthenticated:
        verificationCodeFieldVisiblity = true;
        verificationButtonText = strings
            .emailVerifierFormfieldScreen.verificationButton.unauthenticated;
        break;
      case EmailAuthStatus.authenticating:
        verificationCodeFieldVisiblity = true;
        verificationButtonText = strings
            .emailVerifierFormfieldScreen.verificationButton.authenticating;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    var t = Translations.of(context).emailVerifierFormfieldScreen;
    return Column(
      children: [
        CustomTextFormField(
          fieldName: 'email',
          validator: FieldValidationBuilder.field('email')
              .required(
                  t.emailField.validation.required, AutoValidationMode.always)
              .build(),
          decoration: inputDecoration.copyWith(hintText: t.emailField.hintText),
        ),
        Visibility(
          visible: verificationCodeFieldVisiblity,
          child: TimerTextFormField(
            fieldName: 'emailVerificationCode',
            validator: FieldValidationBuilder.field('emailVerificationCode')
                .required(t.emailVerificationCodeField.validation.required,
                    AutoValidationMode.disabled)
                .customCheck(
                    (val) => true, //TODO: check authentication code
                    t.emailVerificationCodeField.validation.sameAs,
                    AutoValidationMode.disabled)
                .build(),
            hintText: t.emailVerificationCodeField.hintText,
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
