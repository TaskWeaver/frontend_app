import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.title,
    this.hintText,
    this.expanded,
    required this.onSaved,
    required this.validator,
    this.onChanged,
  }) : super(key: key);

  final bool? expanded;
  final String? title;
  final String? hintText;
  final FormFieldSetter<String?> onSaved;
  final FormFieldValidator<String?> validator;
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
        if (title != null)
          Text(
            title!,
            style: textStyle,
          ),
        Expanded(
          flex: (expanded == true) ? 1 : 0,
          child: TextFormField(
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
