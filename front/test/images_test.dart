import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:front/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.onbordingIcon).existsSync(), isTrue);
  });
}
