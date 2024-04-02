import 'package:flutter/material.dart';
import 'package:front/main/widgetbook.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class CheckboxTextRow extends StatelessWidget {
  const CheckboxTextRow(
      {super.key, this.onChanged, required this.text, required this.value});
  final Function(bool?)? onChanged;
  final bool value;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: Row(
        children: [
          Checkbox(value: value, onChanged: onChanged),
          const SizedBox(
            width: 4,
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.black, fontSize: 12),
          )
        ],
      ),
    );
  }
}

@widgetbook.UseCase(
  name: '',
  type: CheckboxTextRow,
)
Widget checkboxTextRowUseCase(BuildContext context) {
  return WidgetBookContainer(
    child: CheckboxTextRow(
        text: context.knobs
            .string(label: 'text', initialValue: 'CheckboxTextRow'),
        value: context.knobs.boolean(label: 'value', initialValue: false),
        onChanged: (_) {}),
  );
}
