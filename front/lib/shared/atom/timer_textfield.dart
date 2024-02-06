import 'package:flutter/material.dart';
import 'package:front/shared/atom/timer.dart';
import 'package:front/shared/helper/FormHelper/form_helper.dart';

class TimerTextField extends StatelessWidget {
  const TimerTextField({
    super.key,
    this.title,
    required this.value,
    required this.hintText,
    required this.validator,
    required this.duration,
  });
  final String? title;
  final String? value;
  final String hintText;
  final Map<ValidateReturnType, String? Function(String? value)> validator;
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
              child: TextFormField(
                initialValue: value,
                validator: validator[ValidateReturnType.onValidate],
                onChanged: validator[ValidateReturnType.onChange],
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(left: 10),
                  hintText: hintText,
                  hintStyle: textStyle,
                  //errorText: errorText,
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
