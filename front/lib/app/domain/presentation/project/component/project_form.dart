import 'package:flutter/material.dart';
import 'package:front/app/domain/presentation/project/component/custom_text_field.dart';
import 'package:front/i18n/strings.g.dart'; // 수정: 생성된 번역 파일 import
import 'package:front/shared/helper/FormHelper/form.dart';
import 'package:front/shared/helper/FormHelper/form_validate_builder.dart';
import 'package:front/shared/helper/FormHelper/interface/form_auto_validation_mode.dart';

typedef VoidCallback = void Function();

class ProjectForm extends StatefulWidget {
  const ProjectForm({
    super.key,
    required this.formKey,
    required this.onFormChanged,
    this.initialValue,
  });

  final GlobalKey<CustomFormState> formKey;
  final VoidCallback onFormChanged;
  final TextStyle h1TextStyle = const TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  final Map<String, dynamic>? initialValue;

  @override
  State<ProjectForm> createState() => _ProjectFormState();
}

class _ProjectFormState extends State<ProjectForm> {
  @override
  Widget build(BuildContext context) {
    var t = Translations.of(context); // 수정: 올바른 번역 객체 접근
    return CustomForm(
      onChanged: widget.onFormChanged,
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildProjectNameField(t), // 수정: 번역 객체 전달
          buildProjectContentField(t), // 수정: 번역 객체 전달
        ],
      ),
    );
  }

  Widget buildProjectNameField(Translations t) {
    // 수정: Translations 객체를 매개변수로 추가
    return Expanded(
      flex: 0,
      child: CustomTextFormFieldWithLabel(
        fieldName: 'name',
        label: t.projectForm.projectTitleLabel,
        initialValue: widget.initialValue?['name'],
        validator: FieldValidationBuilder.field('name')
            .required(
                t.projectForm.projectTitleRequired, AutoValidationMode.disabled)
            .build(),
      ),
    );
  }

  Widget buildProjectContentField(Translations t) {
    // 수정: Translations 객체를 매개변수로 추가
    return Expanded(
      flex: 1,
      child: CustomTextFormFieldWithLabel(
        fieldName: 'description',
        label: t.projectForm.projectContentLabel, // 수정: 번역된 라벨 사용
        initialValue: widget.initialValue?['description'],
        expanded: true,
        validator: FieldValidationBuilder.field('description')
            .required(t.projectForm.projectContentRequired,
                AutoValidationMode.disabled) // 수정: 번역된 유효성 검사 메시지 사용
            .build(),
      ),
    );
  }
}
