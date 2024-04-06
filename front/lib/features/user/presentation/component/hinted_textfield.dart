import 'package:flutter/material.dart';
import 'package:front/main/widgetbook.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class HintedTextField extends StatelessWidget {
  const HintedTextField({super.key,
    this.title,
    required this.hintText,
    required this.onSaved,
    required this.validator,
    this.onChanged,
    this.controller,
  });

  final String? title;
  final String hintText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String>? onChanged;

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(
      fontSize: 12,
      color: Colors.black,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != null
            ? Text(
          title!,
          style: textStyle,
        )
            : Container(),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
          child: TextFormField(
            controller: controller,
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
        )
      ],
    );
  }
}

@widgetbook.UseCase(
  name: '',
  type: HintedTextField,
)
Widget loginScreenUseCase(BuildContext context) {
  return WidgetBookContainer(
      child: HintedTextField(
          hintText:
          context.knobs.string(label: 'hintText', initialValue: 'hintText'),
          title: context.knobs.stringOrNull(label: 'title'),
          onSaved: (_) {},
          validator: (_) => null));
}
