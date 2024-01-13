import 'package:flutter/material.dart';

mixin StateHandlerMixin<T extends StatefulWidget> on State<T> {
  void setStateHandler(VoidCallback callback) {
    if (mounted) {
      setState(callback);
    }
  }
}