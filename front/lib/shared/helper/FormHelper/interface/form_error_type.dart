
enum FieldError {
  requiredField,
  invalidField,
  unExpected,
  alreadyUsedField,
}

extension UIErrorExtension on FieldError {
  String get description {
    switch(this) {
      case FieldError.requiredField: return 'F01: value is required';
      case FieldError.invalidField: return 'F02: invalid form. check your field';
      case FieldError.alreadyUsedField: return 'F03: value is already used.';
      default: return 'F00: unexpected error';
    }
  }
}

