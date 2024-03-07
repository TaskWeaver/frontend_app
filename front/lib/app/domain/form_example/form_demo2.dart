import 'package:flutter/material.dart';
import 'package:front/app/domain/form_example/email_verifier_form_field.dart';
import 'package:front/i18n/strings.g.dart';
import 'package:front/shared/atom/checkbox_form_field.dart';
import 'package:front/shared/atom/checkbox_group_form_field.dart';
import 'package:front/shared/atom/text_form_field.dart';
import 'package:front/shared/helper/FormHelper/form.dart';
import 'package:front/shared/helper/FormHelper/form_validate_builder.dart';
import 'package:front/shared/helper/FormHelper/interface/form_auto_validation_mode.dart';

String passwordRegexPatternString = r'^(?=.*[a-zA-Z].*[a-zA-Z])(?=.*\d).{3,}$';

class FormDemoScreen2 extends StatefulWidget {
  const FormDemoScreen2({super.key});

  @override
  State<FormDemoScreen2> createState() => _FormDemoScreen2State();
}

class _FormDemoScreen2State extends State<FormDemoScreen2> {
  final _formKey = GlobalKey<CustomFormState>();
  final inputDecoration = InputDecoration(
      border: InputBorder.none, filled: true, fillColor: Colors.grey[300]);
  late CustomFormState? currentState;
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
    var translations = Translations.of(context);
    var t = translations.formDemoScreen2;
    var id = _formKey.currentState?.fields['id']?.value;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                //TODO: 이미지 업로딩 추가
                child: CustomForm(
                  key: _formKey,
                  onChanged: onFormChanged,
                  child: Column(
                    children: [
                      Text(t.formDemo),
                      Text('id is $id'),
                      EmailVerifierFormField(strings: translations),
                      CustomTextFormField(
                        fieldName: 'password',
                        validator: FieldValidationBuilder.field('password')
                            .required(t.passwordField.validation.required,
                                AutoValidationMode.onUserInteraction)
                            .pattern(
                                passwordRegexPatternString,
                                t.passwordField.validation
                                    .pattern(minLength: 2),
                                AutoValidationMode.onUserInteraction)
                            .build(),
                        decoration: inputDecoration.copyWith(
                          hintText: t.passwordField.hintText,
                        ),
                      ),
                      CustomTextFormField(
                        fieldName: 'passwordCheck',
                        validator:
                            FieldValidationBuilder.field('passwaordCheck')
                                .required(
                                    t.passwordCheckField.validation.required,
                                    AutoValidationMode.onUserInteraction)
                                .sameAs(
                                    currentState?.fields['password']?.value ??
                                        '',
                                    t.passwordCheckField.validation.sameAs,
                                    AutoValidationMode.onUserInteraction)
                                .build(),
                        decoration: inputDecoration.copyWith(
                          hintText: t.passwordCheckField.hintText,
                        ),
                      ),
                      CustomTextFormField(
                        fieldName: 'nickname',
                        validator: FieldValidationBuilder.field('nickname')
                            .required(t.nicknameField.validation.required,
                                AutoValidationMode.onUserInteraction)
                            .min(
                                2,
                                t.nicknameField.validation
                                    .minLength(minLength: 2),
                                AutoValidationMode.onUserInteraction)
                            .build(),
                        decoration: inputDecoration.copyWith(
                          hintText: t.nicknameField.hintText,
                        ),
                      ),
                      CheckboxGroupFormField(
                        agreeAllCheckBox: CheckboxFormField(
                          fieldName: 'agreeAll',
                          title: t.checkBoxField.agreeAll.title,
                          value: false,
                          validator: FieldValidationBuilder.field('agreeAll')
                              .required(t.checkBoxField.agreeAll.validation,
                                  AutoValidationMode.disabled)
                              .build(),
                        ),
                        checkBoxes: [
                          CheckboxFormField(
                            value: false,
                            fieldName: 'term1',
                            title: t.checkBoxField.serviceTermsTitle,
                            validator:
                                FieldValidationBuilder.field('term1').build(),
                          ),
                          CheckboxFormField(
                            value: false,
                            fieldName: 'term2',
                            title: t.checkBoxField.privacyPolicyTitle,
                            validator:
                                FieldValidationBuilder.field('term2').build(),
                          ),
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () {
                            _formKey.currentState?.validate(null);
                          },
                          child: Text(t.submitButton)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
