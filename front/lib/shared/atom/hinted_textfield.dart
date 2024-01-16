import 'package:flutter/material.dart';
import 'package:front/shared/helper/FormHelper/form_helper.dart';

class HintedTextField extends StatelessWidget {
  const HintedTextField(
    {super.key,
      this.title,
      required this.value,
      required this.hintText,
      required this.validator,
    });
  final String? title;
  final String? value;
  final String hintText;
  final Map<ValidateReturnType, String? Function(String? value)> validator;

  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(
      fontSize: 12,
      color: Colors.black,
    );
    // TODO: 에러 텍스트가 보이는 상황 통제 필요. ex) input focus 후 다음 탭으로 이동할 때만 update 등..
    var errorText = validator[ValidateReturnType.onValidate]!(value);
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
                onChanged:validator[ValidateReturnType.onChange],
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey[300],
                  hintText: hintText,
                  hintStyle: textStyle,
                  errorText: errorText,
                ),
              ),
            )
          ],
        );
  }
}
