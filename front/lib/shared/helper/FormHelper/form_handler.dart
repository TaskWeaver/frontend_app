import 'package:front/shared/helper/FormHelper/interface/form_validate_function.dart';
import 'package:front/shared/helper/FormHelper/interface/form_validate_returnType.dart';
import 'package:front/shared/mixin/mixin.dart';



// TODO: checkbox, radio, file upload 등에도 동일하게 적용 고민 필요
// TODO: 최대한 widget마다 다르게 적용해야 하는 일을 줄이기
// TODO: onSubmit에서 에러가 나면 해당 input으로 focus 보내기
class FormHandler {
  late Map<String, dynamic> fields;
  late void Function(SetStateFunc getNext) setStateHandler;

  void init(Map<String, dynamic> state, void Function(SetStateFunc getNext) setState){
   fields = state;
   setStateHandler = setState;
  }

  void updateField(String fieldName, value) {
    setStateHandler((prev) => {
      ...prev,
      fieldName: value,
    });
  }

  dynamic readValue(String name, defaultValue){
    return fields[name] ?? defaultValue;
  }

  Map<ValidateReturnType, String? Function(String? value)> validateField(String fieldName, List<ValidateFuncList> options) {
    String? onChange(String? value) {
      updateField(fieldName, value);
      return null;
    }

    String? onValidate(value) {
      if(options.isEmpty) return null;
        var invalidValidation = options.firstWhere(
            (option){
              var isPass = option.validateFunc(value) ?? false;
              return !isPass;
            },
            orElse: () => ValidateFuncList(
              validateFunc: (val) { return false; },
              validateMessage: '-1',
            )
        );

        if(invalidValidation.validateMessage == '-1') return null;
        return invalidValidation.validateMessage;
    }

    return {
      ValidateReturnType.onChange: onChange,
      ValidateReturnType.onValidate: onValidate,
    };
  }

  String? Function(bool? value) validateCheck(String fieldName, SetStateFunc afterOnChange) {
    return (value){
      updateField(fieldName, value!);
      setStateHandler(afterOnChange);
      return null;
    };
  }

  Map<String, dynamic> onSubmit() {
    // TODO: submit 조건을 관리하는 로직 추가 필요
    return fields;
  }
}
