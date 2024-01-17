import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  Future<T?> dialog<T>({required Widget child}) {
    return showDialog<T>(
        context: this,
        barrierColor: Colors.grey.withOpacity(0.2),
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: child),
          );
        });
  }
}
