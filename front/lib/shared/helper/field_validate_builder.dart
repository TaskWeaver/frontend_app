// abstract class FieldValidation {
//   String get field;
//   ValidationError? validate(Map input);
// }

class FieldValidateBuilder {
  FieldValidateBuilder({required this.emtpyMessage});

  final String emtpyMessage;
  bool required = false;
  String? pattern;
  num? minLength;
  num? maxLength;
  String? Function(String? value)? validator;
}


// class ValidationBuilder {
//   static ValidationBuilder? _instance;
//   String fieldName;
//   List<FieldValidation> validations = [];

//   ValidationBuilder._(this.fieldName);

//   static ValidationBuilder field(String fieldName) {
//     _instance = ValidationBuilder._(fieldName);
//     return _instance!;
//   }

//   ValidationBuilder required() {
//     validations.add(RequiredFieldValidation(fieldName));
//     return this;
//   }

//   ValidationBuilder email() {
//     validations.add(EmailValidation(fieldName));
//     return this;
//   }

//   ValidationBuilder min(int size) {
//     validations.add(MinLengthValidation(field: fieldName, size: size));
//     return this;
//   }

//   ValidationBuilder sameAs(String fieldToCompare) {
//     validations.add(CompareFieldsValidation(field: fieldName, fieldToCompare: fieldToCompare));
//     return this;
//   }

//   List<FieldValidation> build() => validations;
// }