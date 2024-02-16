import 'package:flutter/material.dart';
import 'package:front/shared/atom/text_form_field.dart';
import 'package:front/shared/helper/FormHelper/interface/form_validate_function.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class CustomTextFormFieldWithLabel extends StatelessWidget {
  const CustomTextFormFieldWithLabel({
    Key? key,
    required this.fieldName,
    this.label,
    this.hintText,
    this.expanded,
    this.onSaved,
    required this.validator,
    this.onChanged,
  }) : super(key: key);

  final bool? expanded;
  final String fieldName;
  final String? label;
  final String? hintText;
  final FormFieldSetter<String?>? onSaved;
  final List<ValidateFuncList>? validator;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(
      fontSize: 12,
      color: Colors.black,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            style: textStyle,
          ),
        Expanded(
          flex: (expanded == true) ? 1 : 0,
          child: CustomTextFormField(
            fieldName: fieldName,
            expands: (expanded == true) ? true : false,
            maxLines: (expanded == true) ? null : 1,
            onChanged: onChanged,
            onSaved: onSaved,
            validator: validator,
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.grey[300],
              hintText: hintText,
              hintStyle: textStyle,
            ),
          ),
        ),
      ],
    );
  }
}

@widgetbook.UseCase(
  name: '',
  type: CustomTextFormFieldWithLabel,
)
Widget CustomTextFielddUseCase(BuildContext context) {
  return SafeArea(
    child: Container(
      color: Colors.white,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormFieldWithLabel(
            hintText: context.knobs
                .string(label: 'hintText', initialValue: 'hintText'),
            label: context.knobs.stringOrNull(label: 'title'),
            expanded:
                context.knobs.boolean(label: 'hintText', initialValue: false),
            onSaved: (_) {},
            validator: null,
            fieldName: 'customTextFormFieldWithLabel',
          ),
        ],
      )),
    ),
  );
}
