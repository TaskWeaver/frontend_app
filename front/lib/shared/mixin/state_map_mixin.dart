import 'package:flutter/material.dart';

typedef SetStateFunc = Map<String, dynamic> Function(Map<String, dynamic> prev);

mixin StateMapHandlerMixin<T extends StatefulWidget> on State<T> {
  Map<String, dynamic> stateMap = {};
  void setStateMap(SetStateFunc callback) {
    if (mounted) {
      var next = callback(stateMap);
      setState((){
        stateMap=next;
      });
    }
  }
}