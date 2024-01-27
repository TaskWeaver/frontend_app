import 'package:front/shared/helper/FormHelper/interface/form_validate_function.dart';
import 'package:front/shared/helper/FormHelper/interface/form_validate_returnType.dart';
import 'package:front/shared/mixin/mixin.dart';

// TODO: checkbox, radio, file upload 등에도 동일하게 적용 고민 필요
// TODO: 최대한 widget마다 다르게 적용해야 하는 일을 줄이기
// TODO: onSubmit에서 에러가 나면 해당 input으로 focus 보내기
class FormHandler {
  late Map<String, dynamic> validationResults;
  late Map<String, dynamic>
      fields; // form 의 field 와 각 field 의 value 를 모두 저장하는 Map
  late void Function(SetStateFunc getNext)
      setStateHandler; // form 의 정보가 update 될 때 page 내에서 setState 를 이용해 위젯이 rebuild 되게 해주는 함수

  void init(Map<String, dynamic> state,
      void Function(SetStateFunc getNext) setState) {
    fields = state;
    validationResults = {};
    setStateHandler = setState;
  }

  void updateField(String fieldName, value) {
    setStateHandler((prev) => {
          ...prev,
          fieldName: value,
        });
  }

  dynamic readValue(String name, defaultValue) {
    return fields[name] ?? defaultValue;
  }

  Map<ValidateReturnType, String? Function(String? value)> validateField(
      // validate 지정하는 함수
      String fieldName,
      List<ValidateFuncList> options) {
    String? onChange(String? value) {
      updateField(fieldName, value);
      return null;
    }

    String? onValidate(value) {
      if (options.isEmpty) return null;
      var invalidValidation = options.firstWhere((option) {
        var isPass = option.validateFunc(value) ?? false; //value 는 해당 필드의 값
        return !isPass;
      },
          orElse: () => ValidateFuncList(
                validateFunc: (val) {
                  return false;
                },
                validateMessage: '-1',
              ));

      if (invalidValidation.validateMessage == '-1') return null;

      return invalidValidation.validateMessage;
    }

    return {
      ValidateReturnType.onChange: onChange,
      ValidateReturnType.onValidate: onValidate,
    };
  }

  bool? Function(bool? value) validateCheck(
      String fieldName, SetStateFunc afterOnChange) {
    return (value) {
      updateField(fieldName, value!);
      setStateHandler(afterOnChange);

      return value;
    };
  }

  String? Function(bool? value) validateCheckbox(
      {required String errorMessage,
      required bool? fieldvalue,
      bool required = true}) {
    //required 이면 check 안될

    String? onValidate(bool? value) {
      value = fieldvalue;
      // 체크박스가 체크되어 있지 않으면 오류 메시지를 반환합니다.
      if (required == false) {
        return null;
      } else {
        if (value == false) {
          return errorMessage;
        } else {
          return null;
        }
      }
    }

    return onValidate;
  }

  Map<String, dynamic> onSubmit() {
    print(fields);
    return fields;
  }
}
