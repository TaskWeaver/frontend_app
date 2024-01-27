import 'package:flutter/material.dart';
import 'package:front/app/domain/presentation/login/component/rounded_elvatedbutton.dart';
import 'package:front/shared/atom/checkbox_formField.dart';
import 'package:front/shared/atom/hinted_textfield.dart';
import 'package:front/shared/atom/timer_textfield.dart';
import 'package:front/shared/helper/FormHelper/interface/form_validate_function.dart';
import 'package:front/shared/helper/helper.dart';
import 'package:front/shared/mixin/mixin.dart';

enum EmailAuthStatus { unauthenticated, authenticating, authenticated }

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
  final GlobalKey<FormState> _allAgreementFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _emailVerificationCodeFormKey =
      GlobalKey<FormState>();
  EmailAuthStatus _status = EmailAuthStatus.unauthenticated;

  @override
  @override
  Widget build(BuildContext context) {
    formHandler.init(stateMap, setStateMap);
    var id = formHandler.readValue('id', '');
    var nickname = formHandler.readValue('nickname', '');
    var password = formHandler.readValue('password', '');
    var passwordCheck = formHandler.readValue('passwordCheck', '');
    var checkbox = formHandler.readValue('allAgreed', false);
    var emailVerificationCode =
        formHandler.readValue('emailVerificationCode', '');
    return _buildScreen(
        id, nickname, password, passwordCheck, checkbox, emailVerificationCode);
  }

  Widget _buildScreen(String id, String nickname, String password,
      String passwordCheck, bool checkbox, String emailVerificationCode) {
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
                child: Column(
                  children: [
                    const Text('Form Demo'),
                    Text('id is $id'),
                    Text('nickname is $nickname'),
                    Text('password is $password'),
                    Text('password check is $passwordCheck'),
                    Text('checkBox is $checkbox'),
                    Text('emailVerificationCode is $emailVerificationCode'),
                    _buildForm(
                      key: _emailFormKey,
                      hintText: '이메일',
                      value: formHandler.readValue('id', ''),
                      fieldName: 'id',
                      validator: FieldValidationBuilder.field('id')
                          .required('이메일을 입력해주세요')
                          .build(),
                    ),
                    emailAuthComponent(),
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
                    _buildCheckBoxAgreementForm(),
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
      ),
    );
  }

  Widget _buildCheckBoxAgreementForm() {
    return Form(
      key: _allAgreementFormKey,
      child: Column(
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

  void _handleFormSubmission() {
    //TODO: 리팩토링 필요
    var emailValidationBool = _emailFormKey.currentState!.validate();
    var nickNameValidationBool = _nickNameFormKey.currentState!.validate();
    var passwordValidationBool = _passwordFormKey.currentState!.validate();
    var passwordCheckValidationBool =
        _passwordCheckFormKey.currentState!.validate();
    var allAgreementValidationBool =
        _allAgreementFormKey.currentState!.validate();

    var allValidationBool = emailValidationBool &&
        nickNameValidationBool &&
        passwordValidationBool &&
        passwordCheckValidationBool &&
        allAgreementValidationBool &&
        _status == EmailAuthStatus.authenticated;

    if (allValidationBool) {
      formHandler.onSubmit();
    }
  }

  Widget emailAuthComponent() {
    switch (_status) {
      case EmailAuthStatus.unauthenticated:
        return _buildEmailAuthButton();
      case EmailAuthStatus.authenticating:
        return _buildEmailAuthForm();
      case EmailAuthStatus.authenticated:
        return _buildEmailAuthCompleted();
      default:
        return Container(); // Handle unexpected states
    }
  }

  Widget _buildEmailAuthButton() {
    return InkWell(
      onTap: startAuthenticating,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white12,
          border: Border.all(width: 1, color: Colors.black),
        ),
        child: const Center(child: Text('이메일 인증')),
      ),
    );
  }

  Widget _buildEmailAuthForm() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Form(
          key: _emailVerificationCodeFormKey,
          child: TimerTextField(
            timeInSeconds: 300,
            value: formHandler.readValue('emailVerificationCode', ''),
            hintText: '인증번호 입력',
            validator: formHandler.validateField(
              'emailVerificationCode',
              FieldValidationBuilder.field('emailVerificationCode')
                  .required('인증번호를 입력해주세요')
                  .build(),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            if (_emailVerificationCodeFormKey.currentState!.validate()) {
              finishAuthenticating();
            }
          },
          child: Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white12,
              border: Border.all(width: 1, color: Colors.black),
            ),
            child: const Center(child: Text('이메일 인증 확인')),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailAuthCompleted() {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white12,
        border: Border.all(width: 1, color: Colors.black),
      ),
      child: const Center(child: Text('이메일 인증 완료')),
    );
  }

  void startAuthenticating() {
    setState(() {
      _status = EmailAuthStatus.authenticating;
    });
    //TODO: 이메일 인증 로직 추가.
  }

  void finishAuthenticating() {
    setState(() {
      _status = EmailAuthStatus.authenticated;
    });
  }
}
