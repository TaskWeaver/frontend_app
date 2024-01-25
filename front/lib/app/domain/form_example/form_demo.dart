import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:front/app/domain/presentation/login/component/rounded_elvatedbutton.dart';
import 'package:front/shared/atom/checkbox_formField.dart';
import 'package:front/shared/atom/hinted_textfield.dart';
import 'package:front/shared/helper/helper.dart';
import 'package:front/shared/mixin/mixin.dart';

String passwordRegexPatternString = r'^(?=.*[a-zA-Z].*[a-zA-Z])(?=.*\d).{3,}$';

class EmailSignInFormBuilderExampleScreen extends StatefulWidget {
  const EmailSignInFormBuilderExampleScreen({Key? key}) : super(key: key);

  @override
  State<EmailSignInFormBuilderExampleScreen> createState() =>
      _EmailSignInFormBuilderExampleScreenState();
}

class _EmailSignInFormBuilderExampleScreenState
    extends State<EmailSignInFormBuilderExampleScreen>
    with StateMapHandlerMixin {
  final FormHandler formHandler = FormHandler();
  final _EmailFormKey = GlobalKey<FormState>();
  final _passwordFormKey = GlobalKey<FormState>();
  final _passwordCheckFormKey = GlobalKey<FormState>();
  final _nickNameFormKey = GlobalKey<FormState>();

  File? imgFile;
  var isImageLoading = false;

  Future<void> pickImage() async {
    var result = await FilePicker.platform.pickFiles(
      type: FileType.image, // select only images
    );

    if (result != null) {
      setState(() {
        isImageLoading = true;

        imgFile =
            File(result.files.single.path!); // Make the selected image file
        print('File Path: ${imgFile!.path}');
      });
    } else {
      // If the user cancels the selection
      print('No image selected');
    }

    setState(() {
      isImageLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    formHandler.init(stateMap, setStateMap);
    var id = formHandler.readValue('id', '');
    var nickname = formHandler.readValue('nickname', '');
    var password = formHandler.readValue('password', '');
    var passwordCheck = formHandler.readValue('passwordCheck', '');
    var checkbox = formHandler.readValue('allAgreed', false);
    var checkboxValue = false;
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
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
                    Text('checkBox is $checkbox'),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: imgFile == null
                            ? GestureDetector(
                                onTap: pickImage,
                                child: Container(
                                  width: 100, // 원의 너비
                                  height: 100, // 원의 높이
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle, // 동그라미 모양
                                    color: Colors.grey[300], // 회색
                                  ),
                                  child: const Center(child: Text('이미지')),
                                ),
                              )
                            : isImageLoading
                                ? const CircularProgressIndicator()
                                : Container(
                                    width: 100, // 원의 너비
                                    height: 100, // 원의 높이
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle, // 동그라미 모양
                                      color: Colors.grey[300], // 회색
                                    ),
                                    child: Image.file(imgFile!),
                                  )),
                    Form(
                      key: _EmailFormKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: HintedTextField(
                        hintText: '이메일',
                        value: formHandler.readValue('id', ''),
                        validator: formHandler.validateField(
                            'id',
                            FieldValidationBuilder.field('id')
                                .required('이메일을 입력해주세요')
                                .build()),
                      ),
                    ),
                    Form(
                      key: _passwordFormKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: HintedTextField(
                        hintText: '비밀번호',
                        value: formHandler.readValue('password', ''),
                        validator: formHandler.validateField(
                            'password',
                            FieldValidationBuilder.field('password')
                                .required('비밀번호를 입력해주세요')
                                .pattern(passwordRegexPatternString,
                                    '영어 대소문자, 숫자가 2개 이상 사용되어야 합니다.')
                                .build()),
                      ),
                    ),
                    Form(
                      key: _passwordCheckFormKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: HintedTextField(
                        hintText: '비밀번호확인',
                        value: formHandler.readValue('passwordCheck', ''),
                        validator: formHandler.validateField(
                            'passwordCheck',
                            FieldValidationBuilder.field('passwordCheck')
                                .required('비밀번호를 확인해주세요')
                                .sameAs(formHandler.readValue('password', ''),
                                    '비밀번호와 일치하지 않습니다.')
                                .build()),
                      ),
                    ),
                    Form(
                      key: _nickNameFormKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: HintedTextField(
                        hintText: '닉네임',
                        value: formHandler.readValue('nickname', ''),
                        validator: formHandler.validateField(
                            'nickname',
                            FieldValidationBuilder.field('nickname')
                                .required('닉네임을 입력해주세요')
                                .min(2, '2글자 이상 입력해주세요')
                                .build()),
                      ),
                    ),
                    CustomCheckbox(
                      title: '전체 동의',
                      value: formHandler.readValue('allAgreed', false),
                      onChanged: formHandler.validateCheck(
                        'allAgreed',
                        (fields) => {
                          ...fields,
                          'personalInfoAgreed': fields['allAgreed'],
                          'termsAgreed': fields['allAgreed']
                        },
                      ),
                      validator: formHandler.validateCheckbox(
                          errorMessage: '체크박스를 체크해주세요',
                          fieldvalue:
                              formHandler.readValue('allAgreed', false)),
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
                              CustomCheckbox(
                                validator: formHandler.validateCheckbox(
                                    errorMessage: '체크박스를 체크해주세요',
                                    fieldvalue: formHandler.readValue(
                                        'personalInfoAgreed', false)),
                                title: '개인 정보 약관 동의',
                                value: formHandler.readValue(
                                    'personalInfoAgreed', false),
                                onChanged: formHandler.validateCheck(
                                    'personalInfoAgreed',
                                    (fields) => {
                                          ...fields,
                                          'allAgreed':
                                              fields['personalInfoAgreed'] &&
                                                  fields['termsAgreed']
                                        }),
                              ),
                              CustomCheckbox(
                                validator: formHandler.validateCheckbox(
                                    errorMessage: '체크박스를 체크해주세요',
                                    fieldvalue: formHandler.readValue(
                                        'termsAgreed', false)),
                                title: '이용 약관 동의',
                                value:
                                    formHandler.readValue('termsAgreed', false),
                                onChanged: formHandler.validateCheck(
                                    'termsAgreed',
                                    (fields) => {
                                          ...fields,
                                          'allAgreed':
                                              fields['personalInfoAgreed'] &&
                                                  fields['termsAgreed']
                                        }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    RoundedElevatedButton(
                      text: '회원가입',
                      onPressed: () {
                        // if (_formKey.currentState!.validate()) {
                        //   formHandler.onSubmit();
                        // }
                      },
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
