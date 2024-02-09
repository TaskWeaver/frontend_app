import 'package:flutter/material.dart';
import 'package:front/app/domain/form_example/email_verifier_form_field.dart';
import 'package:front/shared/atom/checkbox_form_field.dart';
import 'package:front/shared/atom/checkbox_group_form_field.dart';
import 'package:front/shared/atom/text_form_field.dart';
import 'package:front/shared/helper/FormHelper/form.dart';
import 'package:front/shared/helper/FormHelper/form_validate_builder.dart';
import 'package:front/shared/helper/FormHelper/interface/form_validate_option.dart';

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
                      const Text('Form Demo'),
                      Text('id is $id'),
                      const EmailVerifierFormField(),
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
                      CustomTextFormField(
                        fieldName: 'passwordCheck',
                        validator:
                            FieldValidationBuilder.field('passwaordCheck')
                                .required('비밀번호를 확인해주세요',
                                    AutoValidationMode.onUserInteraction)
                                .sameAs(
                                    currentState?.fields['password']?.value ??
                                        '',
                                    '비밀번호와 일치하지 않습니다.',
                                    AutoValidationMode.onUserInteraction)
                                .build(),
                        decoration: inputDecoration.copyWith(
                          hintText: '비밀번호 확인',
                        ),
                      ),
                      CustomTextFormField(
                        fieldName: 'nickname',
                        validator: FieldValidationBuilder.field('nickname')
                            .required('닉네임을 입력해주세요',
                                AutoValidationMode.onUserInteraction)
                            .min(2, '2글자 이상 입력해주세요',
                                AutoValidationMode.onUserInteraction)
                            .build(),
                        decoration: inputDecoration.copyWith(
                          hintText: '닉네임',
                        ),
                      ),
                      CheckboxGroupFormField(
                        agreeAllCheckBox: CheckboxFormField(
                          fieldName: 'agreeAll',
                          title: '모두 동의',
                          value: false,
                          validator: FieldValidationBuilder.field('agreeAll')
                              .required('이용약관 동의가 필요합니다.',
                                  AutoValidationMode.disabled)
                              .build(),
                        ),
                        checkBoxes: [
                          CheckboxFormField(
                            value: false,
                            fieldName: 'term1',
                            title: '서비스 이용약관 동의 (필수)',
                            validator:
                                FieldValidationBuilder.field('term1').build(),
                          ),
                          CheckboxFormField(
                            value: false,
                            fieldName: 'term2',
                            title: '개인정보 수집, 이용 동의 (필수)',
                            validator:
                                FieldValidationBuilder.field('term2').build(),
                          ),
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () {
                            _formKey.currentState?.validate(null);
                          },
                          child: const Text('check')),
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
