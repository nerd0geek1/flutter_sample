import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';

extension SetScreenSize on WidgetTester {
  Future<void> setIPhoneXSScreenSize() async {
    await _setScreenSize(
      375,
      812,
      3,
    );
  }

  Future<void> setPixel4ScreenSize() async {
    await _setScreenSize(
      414,
      869,
      3,
    );
  }

  Future<void> _setScreenSize(double width, double height, double scale) async {
    final size = Size(width, height);
    await binding.setSurfaceSize(size);
    binding.window.physicalSizeTestValue = size;
    binding.window.devicePixelRatioTestValue = scale;
  }
}
