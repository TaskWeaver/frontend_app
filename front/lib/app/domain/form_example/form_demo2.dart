import 'package:flutter/material.dart';
import 'package:front/app/domain/form_example/email_verifier_form_field.dart';
import 'package:front/shared/helper/FormHelper/component/text_form_field.dart';
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
