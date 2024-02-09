import 'package:front/shared/helper/FormHelper/interface/form_validate_option.dart';

// ignore: avoid_annotating_with_dynamic
typedef ValidateFunc = bool? Function(dynamic val);

class ValidateFuncList {
  ValidateFuncList({
    required this.validateFunc,
    required this.validateMessage,
    required this.autoValidationMode,
    this.status = false,
  });
  final ValidateFunc validateFunc;
  final String validateMessage;
  final AutoValidationMode autoValidationMode;
  bool status;
}
