typedef ValidateFunc = bool? Function(String? val);

class ValidateFuncList {
  ValidateFuncList({required this.validateFunc, required this.validateMessage});
  final ValidateFunc validateFunc;
  final String validateMessage;
}