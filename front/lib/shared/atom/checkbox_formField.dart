import 'package:flutter/material.dart';

class CustomCheckbox extends FormField<bool> {
  CustomCheckbox(
      {super.key,
      required String title,
      required bool value,
      required Function onChanged,
      required FormFieldValidator<bool?> validator})
      : super(
          builder: (state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: value,
                      onChanged: (value) {
                        state.didChange(onChanged(value));
                      },
                    ),
                    Text(title),
                  ],
                ),
                if (state.errorText != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      state.errorText!,
                      style: const TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  )
              ],
            );
          },
          validator: validator,
        );
}
