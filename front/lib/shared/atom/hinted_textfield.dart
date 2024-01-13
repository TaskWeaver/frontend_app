import 'package:flutter/material.dart';

class HintedTextField extends StatelessWidget {
  const HintedTextField(
      {super.key,
      this.title,
      required this.hintText,
      required this.validator,
      this.onChanged});
  final String? title;
  final String hintText;
  final FormFieldValidator<String> validator;
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
