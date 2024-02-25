import 'package:flutter/material.dart';
import 'package:front/app/domain/presentation/project/component/custom_text_field.dart';
import 'package:front/app/domain/presentation/project/component/project_administrator.dart';
import 'package:front/core/user/models/user.dart';
import 'package:front/shared/helper/FormHelper/form.dart';
import 'package:front/shared/helper/FormHelper/form_validate_builder.dart';
import 'package:front/shared/helper/FormHelper/interface/form_auto_validation_mode.dart';

typedef VoidCallback = void Function();

class ProjectFrom extends StatefulWidget {
  const ProjectFrom(
      {super.key,
      required this.formKey,
      required this.onFormChanged,
      this.initialValue});
  final GlobalKey<CustomFormState> formKey;
  final VoidCallback onFormChanged;
  final TextStyle h1TextStyle = const TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);
  final Map<String, dynamic>? initialValue;

  @override
  State<ProjectFrom> createState() => _ProjectFromState();
}

class _ProjectFromState extends State<ProjectFrom> {
  @override
  Widget build(BuildContext context) {
    return CustomForm(
      onChanged: widget.onFormChanged,
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildProjectNameField(),
          buildProjectContentField(),
        ],
      ),
    );
  }

  Widget buildProjectNameField() {
    return Expanded(
      flex: 0,
      child: CustomTextFormFieldWithLabel(
          fieldName: 'name',
          label: '프로젝트 제목',
          initialValue: widget.initialValue?['name'],
          validator: FieldValidationBuilder.field('name')
              .required('프로젝트 제목을 입력해주세요', AutoValidationMode.disabled)
              .build()),
    );
  }

  Widget buildProjectContentField() {
    return Expanded(
      flex: 1,
      child: CustomTextFormFieldWithLabel(
        fieldName: 'description',
        label: '프로젝트 내용',
        initialValue: widget.initialValue?['description'],
        expanded: true,
        validator: FieldValidationBuilder.field('description')
            .required('프로젝트 내용을 입력해주세요', AutoValidationMode.disabled)
            .build(),
      ),
    );
  }
}
