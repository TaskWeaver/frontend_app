import 'package:front/core/network_handling/exceptions/custom_exception.dart';

class ExceptionHandler {
  static showToast(Exception e) {
    if (Exception is CustomException) {
      var exception = e as CustomException;
      // ToastService.show(NormalToast(message: '${exception.message}'));
    } else {
      // ToastService.show(NormalToast(message: '$e'));
    }
  }
}
