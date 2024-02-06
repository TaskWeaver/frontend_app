import 'package:flutter/material.dart';
import 'package:front/shared/atom/timer.dart';
import 'package:front/shared/helper/FormHelper/component/text_form_field.dart';
import 'package:front/shared/helper/FormHelper/interface/form_validate_function.dart';

class TimerTextFormField extends StatelessWidget {
  const TimerTextFormField({
    super.key,
    this.title,
    required this.fieldName,
    required this.hintText,
    required this.validator,
    required this.duration,
  });

  final String fieldName;
  final String? title;
  final String hintText;
  final List<ValidateFuncList>? validator;
  final Duration duration;
  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(
      fontSize: 12,
      color: Colors.black,
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 9,
              child: CustomTextFormField(
                fieldName: fieldName,
                validator: validator,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(left: 10),
                  hintText: hintText,
                  hintStyle: textStyle,
                ),
              ),
            ),
            Expanded(
              //Timer
              flex: 1,
              child: TimerWidget(duration: duration),
            )
          ],
        ),
      ),
    );
  }
}
