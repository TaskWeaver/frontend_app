bool checkStrValidatePattern(String? value, String pattern) {
  if(value == null) return false;
  var regex = RegExp(pattern);
  return regex.hasMatch(value);
}

bool checkStrIsSame(String? value1, String? value2){
  if(value1 == null || value2 == null) return false;
  return value1 == value2;
}

bool checkStrIsPassValidate(String? value, bool Function(String value) validate){
  if(value == null) return false;
  return validate(value);
}

bool checkStrIsPassMinLength(String? value, num minNumber){
  if(value == null) return false;
  return value.length >= minNumber;
}

bool checkStrIsPassMaxLength(String? value, num naxNumber){
  if(value == null) return false;
  return value.length <= naxNumber;
}

bool checkIsNotEmpty(value) {
  if (value == null) {
    return false;
  }

  if (value is String && value.trim() == '') {
    return false;
  }

  if (value is List && value.isEmpty) {
    return false;
  }

  if (value is Map && value.keys.isEmpty) {
    return false;
  }

  return true;
}



