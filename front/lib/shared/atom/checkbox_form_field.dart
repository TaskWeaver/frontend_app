import 'package:flutter/material.dart';
import 'package:front/shared/helper/FormHelper/form.dart';

class CheckboxFormField extends CustomFormField<bool> {
  CheckboxFormField(
      {super.key,
      required this.value,
      required super.fieldName,
      required this.title,
      Function? onChanged,
      required super.validator})
      : super(
          builder: (field) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: value,
                      onChanged: (state) {
                        debugPrint('$fieldName : $state');
                        onChanged?.call(state);
                        field.didChange(state);
                      },
                    ),
                    Text(title),
                  ],
                ),
                if (field.errorText != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      field.errorText!,
                      style: const TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  )
              ],
            );
          },
        );
  final bool value;
  final String title;
  @override
  CustomFormFieldState<bool> createState() => _CustomCheckBoxFormFieldState();
}

class _CustomCheckBoxFormFieldState extends CustomFormFieldState<bool> {
  
}
