
enum UIError {
  requiredField,
  invalidField,
  unexpected,
  alreadyUsedField,
}

extension UIErrorExtension on UIError {
  String get description {
    switch(this) {
      case UIError.requiredField: return 'F01: value is required';
      case UIError.invalidField: return 'F02: invalid form. check your field';
      case UIError.alreadyUsedField: return 'F03: value is already used.';
      default: return 'F00: unexpected error';
    }
  }
}

