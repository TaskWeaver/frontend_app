import 'package:flutter/material.dart';
import 'package:front/app/locator.dart';

class AuthController with ChangeNotifier {
  AuthController() {
    checkToken();
  }
  bool isToken = false;

  void checkToken() async {
    var result = await checkTokenUseCase.call();

    result.fold(
      onSuccess: (value) {
        isToken = value;
      },
      onFailure: (e) {
        isToken = false;
        print(e.toString());
      },
    );

    notifyListeners();
  }
}
