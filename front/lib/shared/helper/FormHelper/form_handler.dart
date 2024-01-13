import 'package:flutter/material.dart';
import 'package:front/shared/helper/helper.dart';

class FormHandler  {

  GlobalKey<FormState> formKey = GlobalKey();

  Map<String, dynamic> fields = {};

  late void Function(VoidCallback callback) setStateHandler;

  void init(void Function(VoidCallback callback) mixinStateHandler){
   setStateHandler = mixinStateHandler;
  }

  void updateField(String fieldName, value) {
    fields[fieldName] = value;
  }

  dynamic readValue(String name, defaultValue){
    var value = fields[name];
    if(value == null) {
      fields[name] = defaultValue;
      return defaultValue;
    }
    return fields[name];
  }

  String? Function(String? value) validateField(String fieldName, FieldValidateBuilder options) {
    return (value){
      fields[fieldName] = value;
      if (value == null || value.isEmpty) {
        return options.emtpyMessage;
      }
      return null;
    };
  }

  String? Function(bool? value) validateCheck(String fieldName, void Function(Map<String, dynamic> fields) afterOnChange) {
    return (value){
      setStateHandler((){
        fields[fieldName] = value;
        afterOnChange(fields);
      });
      return null;
    };
  }


  void updateAllAgreed() {
    fields['allAgreed'] = fields['personalInfoAgreed'] && fields['termsAgreed'];
  }

  bool validateFieldForm() {
    return formKey.currentState?.validate() ?? false;
  }

  Map<String, dynamic> onSubmit() {
    return fields;
  }
}
