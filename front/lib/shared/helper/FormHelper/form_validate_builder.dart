import 'package:front/shared/helper/FormHelper/interface/form_validate_function.dart';
import 'package:front/shared/helper/FormHelper/interface/form_validate_option.dart';
import 'package:front/shared/utils/validate.dart';


class FieldValidationBuilder {
  FieldValidationBuilder._(this.fieldName);
  static FieldValidationBuilder? _instance;

  String fieldName;
  List<ValidateFuncList> validations = [];

  static FieldValidationBuilder field(String fieldName) {
    _instance = FieldValidationBuilder._(fieldName);
    return _instance!;
  }

  FieldValidationBuilder required(String? message, ValidateOption validateOption) {
    var errorMessage = message ?? 'Please enter a value for $fieldName';
    validations.add(ValidateFuncList(validateFunc: checkIsNotEmpty, validateMessage: errorMessage, validateOption: validateOption));
    return this;
  }

  FieldValidationBuilder pattern(String pattern, String? message, ValidateOption validateOption) {
    var errorMessage = message ?? 'Please check a value for $fieldName';
    validations.add(ValidateFuncList(validateFunc: (val) => checkStrValidatePattern(val, pattern), validateMessage: errorMessage, validateOption: validateOption));
    return this;
  }

  FieldValidationBuilder min(int size, String? message, ValidateOption validateOption) {
    var errorMessage = message ?? 'Please check a value length for $fieldName';
    validations.add(ValidateFuncList(validateFunc: (val) => checkStrIsPassMinLength(val, size), validateMessage: errorMessage, validateOption: validateOption));
    return this;
  }

  FieldValidationBuilder max(int size, String? message, ValidateOption validateOption) {
    var errorMessage = message ?? 'Please check a value length for $fieldName';
    validations.add(ValidateFuncList(validateFunc: (val) => checkStrIsPassMaxLength(val, size), validateMessage: errorMessage, validateOption: validateOption));
    return this;
  }

  FieldValidationBuilder sameAs(String fieldToCompare, String? message, ValidateOption validateOption) {
    var errorMessage = message ?? 'Please check a value for $fieldName';
    validations.add(ValidateFuncList(validateFunc: (val) => checkStrIsSame(val, fieldToCompare), validateMessage: errorMessage, validateOption: validateOption));
    return this;
  }

  FieldValidationBuilder customCheck(ValidateFunc func, String? message, ValidateOption validateOption) {
    var errorMessage = message ?? 'Please check a value for $fieldName';
    validations.add(ValidateFuncList(validateFunc: func, validateMessage: errorMessage, validateOption: validateOption));
    return this;
  }

  List<ValidateFuncList> build() => validations;
}