import 'package:front/shared/helper/FormHelper/interface/form_validate_option.dart';

typedef ValidateFunc = bool? Function(dynamic val);

class ValidateFuncList {
  ValidateFuncList(
      {required this.validateFunc,
      required this.validateMessage,
      required this.validateOption,
      this.status = false,});
  final ValidateFunc validateFunc;
  final String validateMessage;
  final ValidateOption validateOption;
  bool status;
}
