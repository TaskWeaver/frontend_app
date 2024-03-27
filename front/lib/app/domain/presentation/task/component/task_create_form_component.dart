import 'package:flutter/material.dart';
import 'package:front/app/domain/presentation/project/component/custom_text_field.dart';
import 'package:front/i18n/strings.g.dart';
import 'package:front/shared/helper/FormHelper/form.dart';
import 'package:front/shared/helper/FormHelper/form_validate_builder.dart';
import 'package:front/shared/helper/FormHelper/interface/form_auto_validation_mode.dart';

typedef VoidCallback = void Function();

class TaskCreateForm extends StatefulWidget {
  const TaskCreateForm({
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
  State<TaskCreateForm> createState() => _TaskCreateFormState();
}

class _TaskCreateFormState extends State<TaskCreateForm> {
  @override
  Widget build(BuildContext context) {
    var t = Translations.of(context);
    return CustomForm(
      onChanged: widget.onFormChanged,
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          buildTaskNameField(t),
          buildTaskContentField(t),
          buildTaskDueDateField(t),
        ],
      ),
    );
  }

  Widget buildTaskNameField(Translations t) {
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

  Widget buildTaskContentField(Translations t) {
    return CustomTextFormFieldWithLabel(
      fieldName: 'description',
      label: t.projectForm.projectContentLabel,
      initialValue: widget.initialValue?['description'],
      validator: FieldValidationBuilder.field('description')
          .required(t.projectForm.projectContentRequired,
              AutoValidationMode.disabled)
          .build(),
    );
  }

  Widget buildTaskDueDateField(Translations t) {
    return CustomTextFormFieldWithLabel(
      fieldName: 'dueDate',
      label: t.projectForm.projectContentLabel,
      initialValue: widget.initialValue?['dueDate'],
      validator: FieldValidationBuilder.field('dueDate')
          .required(t.projectForm.projectContentRequired,
              AutoValidationMode.disabled)
          .build(),
    );
  }
}
