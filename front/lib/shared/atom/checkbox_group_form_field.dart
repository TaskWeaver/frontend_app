import 'package:flutter/material.dart';
import 'package:front/shared/atom/checkbox_form_field.dart';

class CheckboxGroupFormField extends StatefulWidget {
  //TODO: open dialog when validationError
  //FIXME: fix children checkboxes validation not tirigering when allAgreeCheckbox is checked
  const CheckboxGroupFormField({
    super.key,
    required this.checkBoxes,
    this.agreeAllCheckBox,
  });

  final CheckboxFormField? agreeAllCheckBox;
  final List<CheckboxFormField> checkBoxes;

  @override
  State<CheckboxGroupFormField> createState() => _CheckboxGroupFormFieldState();
}

class _CheckboxGroupFormFieldState extends State<CheckboxGroupFormField> {
  List<bool> values = [];
  late bool allAgreeCheckboxValue;

  @override
  void initState() {
    super.initState();
    allAgreeCheckboxValue = widget.agreeAllCheckBox!.value;
    for (var i = 0; i < widget.checkBoxes.length; i++) {
      values.add(widget.checkBoxes[i].value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.agreeAllCheckBox != null
            ? CheckboxFormField(
                key: widget.agreeAllCheckBox!.key,
                value: allAgreeCheckboxValue,
                onChanged: (value) {
                  setState(
                    () {
                      for (var i = 0; i < widget.checkBoxes.length; i++) {
                        values[i] = value;
                      }
                      allAgreeCheckboxValue = value!;
                    },
                  );
                },
                fieldName: widget.agreeAllCheckBox!.fieldName,
                title: widget.agreeAllCheckBox!.title,
                validator: widget.agreeAllCheckBox!.validator,
              )
            : Container(),
        Expanded(
          flex: 0,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: () {
                  var result = <Widget>[];
                  for (var i = 0; i < widget.checkBoxes.length; i++) {
                    result.add(CheckboxFormField(
                      fieldName: widget.checkBoxes[i].fieldName,
                      validator: widget.checkBoxes[i].validator,
                      value: values[i],
                      title: widget.checkBoxes[i].title,
                      onChanged: (value) {
                        setState(() {
                          values[i] = value;
                          allAgreeCheckboxValue =
                              values.every((element) => element);
                        });
                      },
                    ));
                  }
                  return result;
                }(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
