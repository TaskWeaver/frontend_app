bool checkStrValidatePattern(String value, String pattern) {
  var regex = RegExp(pattern);
  return regex.hasMatch(value);
}

bool checkStrIsSame(String value1, String value2){
  return value1 == value2;
}

bool checkStrIsPassValidate(String value, bool Function(String value) validate){
  return validate(value);
}

class Key {
  Key({required this.name, this.required = false});
  String name;
  bool required;
}

class Data {
  Data({required this.name, this.value, this.options});
  String name;
  dynamic value;
  Options? options;
}

class Options {
  Options({this.required = false, this.validate});
  bool required;
  // ignore: avoid_annotating_with_dynamic
  bool Function(dynamic value)? validate;
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

bool checkIsValidateFormat(List<Data> target, List<Key> keyList) {
  var mustKey = keyList.where((key) => key.required);
  var mustNameKey = mustKey.map((key) => key.name).toList();
  var filteredValue = target.where((data) =>
      mustNameKey.contains(data.name) && checkIsNotEmpty(data.value) && data.options!.validate!(data.value));

  return mustKey.length == filteredValue.length;
}

