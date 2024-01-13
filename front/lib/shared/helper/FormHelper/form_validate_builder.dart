import 'package:front/shared/helper/FormHelper/interface/form_validate_function.dart';
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

  FieldValidationBuilder required(String? message) {
    var errorMessage = message ?? 'Please enter a value for $fieldName';
    validations.add(ValidateFuncList(validateFunc: checkIsNotEmpty, validateMessage: errorMessage));
    return this;
  }

  FieldValidationBuilder pattern(String pattern, String? message) {
    var errorMessage = message ?? 'Please check a value for $fieldName';
    validations.add(ValidateFuncList(validateFunc: (val) => checkStrValidatePattern(val, pattern), validateMessage: errorMessage));
    return this;
  }

  FieldValidationBuilder min(int size, String? message) {
    var errorMessage = message ?? 'Please check a value length for $fieldName';
    validations.add(ValidateFuncList(validateFunc: (val) => checkStrIsPassMinLength(val, size), validateMessage: errorMessage));
    return this;
  }

  FieldValidationBuilder max(int size, String? message) {
    var errorMessage = message ?? 'Please check a value length for $fieldName';
    validations.add(ValidateFuncList(validateFunc: (val) => checkStrIsPassMaxLength(val, size), validateMessage: errorMessage));
    return this;
  }

  FieldValidationBuilder sameAs(String fieldToCompare, String? message) {
    var errorMessage = message ?? 'Please check a value for $fieldName';
    validations.add(ValidateFuncList(validateFunc: (val) => checkStrIsSame(val, fieldToCompare), validateMessage: errorMessage));
    return this;
  }

  FieldValidationBuilder customCheck(ValidateFunc func, String? message) {
    var errorMessage = message ?? 'Please check a value for $fieldName';
    validations.add(ValidateFuncList(validateFunc: func, validateMessage: errorMessage));
    return this;
  }

  List<ValidateFuncList> build() => validations;
}