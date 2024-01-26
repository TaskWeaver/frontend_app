import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:front/app/domain/presentation/login/component/rounded_elvatedbutton.dart';
import 'package:front/shared/atom/checkbox_formField.dart';
import 'package:front/shared/atom/hinted_textfield.dart';
import 'package:front/shared/helper/FormHelper/interface/form_validate_function.dart';
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
  final GlobalKey<FormState> _emailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _passwordFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _passwordCheckFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _nickNameFormKey = GlobalKey<FormState>();

  File? imgFile;
  var isImageLoading = false;

  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void nextPage() {
    if (_currentPage < 2) {
      _currentPage++;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void prevPage() {
    if (_currentPage >= 1) {
      _currentPage--;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> pickImage() async {
    var result = await FilePicker.platform.pickFiles(
      type: FileType.image, // select only images
    );

    if (result != null) {
      setState(() {
        isImageLoading = true;
        imgFile = File(result.files.single.path!);
        print('File Path: ${imgFile!.path}');
      });
    } else {
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

    return PageView(
      controller: _pageController,
      onPageChanged: (page) {
        setState(() {
          _currentPage = page;
        });
      },
      children: [
        _buildFirstPage(id, nickname, password, passwordCheck, checkbox),
        _buildSecondPage(),
      ],
    );
  }

  Widget _buildFirstPage(
    String id,
    String nickname,
    String password,
    String passwordCheck,
    bool checkbox,
  ) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
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
                  _buildImagePicker(),
                  _buildForm(
                    key: _emailFormKey,
                    hintText: '이메일',
                    value: formHandler.readValue('id', ''),
                    fieldName: 'id',
                    validator: FieldValidationBuilder.field('id')
                        .required('이메일을 입력해주세요')
                        .build(),
                  ),
                  _buildForm(
                    key: _passwordFormKey,
                    hintText: '비밀번호',
                    value: formHandler.readValue('password', ''),
                    fieldName: 'password',
                    validator: FieldValidationBuilder.field('password')
                        .required('비밀번호를 입력해주세요')
                        .pattern(passwordRegexPatternString,
                            '영어 대소문자, 숫자가 2개 이상 사용되어야 합니다.')
                        .build(),
                  ),
                  _buildForm(
                      key: _passwordCheckFormKey,
                      hintText: '비밀번호확인',
                      value: formHandler.readValue('passwordCheck', ''),
                      fieldName: 'passwordCheck',
                      validator: FieldValidationBuilder.field('passwordCheck')
                          .required('비밀번호를 확인해주세요')
                          .sameAs(formHandler.readValue('password', ''),
                              '비밀번호와 일치하지 않습니다.')
                          .build()),
                  _buildForm(
                      key: _nickNameFormKey,
                      hintText: '닉네임',
                      value: formHandler.readValue('nickname', ''),
                      fieldName: 'nickname',
                      validator: FieldValidationBuilder.field('nickname')
                          .required('닉네임을 입력해주세요')
                          .min(2, '2글자 이상 입력해주세요')
                          .build()),
                  const SizedBox(height: 10),
                  RoundedElevatedButton(
                    text: '회원가입',
                    onPressed: _handleFormSubmission,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSecondPage() {
    return Scaffold(
      body: Column(
        children: [
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
                fieldvalue: formHandler.readValue('allAgreed', false)),
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
                    _buildCheckbox(
                      'personalInfoAgreed',
                      '개인 정보 약관 동의',
                    ),
                    _buildCheckbox(
                      'termsAgreed',
                      '이용 약관 동의',
                    ),
                    RoundedElevatedButton(
                      text: '회원가입',
                      onPressed: () {
                        prevPage();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckbox(String fieldName, String title) {
    return CustomCheckbox(
      validator: formHandler.validateCheckbox(
        errorMessage: '체크박스를 체크해주세요',
        fieldvalue: formHandler.readValue(fieldName, false),
      ),
      title: title,
      value: formHandler.readValue(fieldName, false),
      onChanged: formHandler.validateCheck(
        fieldName,
        (fields) => {
          ...fields,
          'allAgreed': fields['personalInfoAgreed'] && fields['termsAgreed']
        },
      ),
    );
  }

  Widget _buildForm({
    required GlobalKey<FormState> key,
    required String hintText,
    required String value,
    required String fieldName,
    required List<ValidateFuncList> validator,
  }) {
    return Form(
      key: key,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: HintedTextField(
        hintText: hintText,
        value: value,
        validator: formHandler.validateField(fieldName, validator),
      ),
    );
  }

  Widget _buildImagePicker() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: imgFile == null
          ? GestureDetector(
              onTap: pickImage,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
                child: const Center(child: Text('이미지')),
              ),
            )
          : isImageLoading
              ? const CircularProgressIndicator()
              : Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                  child: Image.file(imgFile!),
                ),
    );
  }

  void _handleFormSubmission() {
    var emailValidationBool = _emailFormKey.currentState!.validate();
    var nickNameValidationBool = _nickNameFormKey.currentState!.validate();
    var passwordValidationBool = _passwordFormKey.currentState!.validate();
    var passwordCheckValidationBool =
        _passwordCheckFormKey.currentState!.validate();

    var allValidationBool = emailValidationBool &&
        nickNameValidationBool &&
        passwordValidationBool &&
        passwordCheckValidationBool;

    if (allValidationBool) {
      formHandler.onSubmit();
      nextPage();
    }
  }
}
