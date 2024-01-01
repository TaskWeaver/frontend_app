import 'package:flutter/material.dart';

class HintedTextField extends StatelessWidget {
  final String? title;
  final String hintText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final void Function(String?)? onChanged;
  const HintedTextField(
      {super.key,
      this.title,
      required this.hintText,
      required this.onSaved,
      required this.validator,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(
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
