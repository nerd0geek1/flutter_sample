import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttersample/presentation_layer/screen/generic_sample/generic_sample_page.dart';

import '../../../widget_test_helper.dart';
import '../../../widget_tester_extension.dart';

void main() {
  group('GenericSamplePage', () {
    testWidgets('when platform is iOS, it will show iOS style UI', (WidgetTester tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

      await tester.setIPhoneXSScreenSize();
      await tester.pumpWidget(
        WidgetTestHelper.wrapWithMaterialAppAndLocalization(
          const GenericSamplePage(),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(GenericSamplePage).first,
        matchesGoldenFile('../../../golden_files/generic_sample_page_ios.png'),
      );

      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets('when platform is Android, it will show Android style UI', (WidgetTester tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;

      await tester.setPixel4ScreenSize();
      await tester.pumpWidget(
        WidgetTestHelper.wrapWithMaterialAppAndLocalization(
          const GenericSamplePage(
            drawer: Drawer(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(GenericSamplePage).first,
        matchesGoldenFile('../../../golden_files/generic_sample_page_android.png'),
      );

      debugDefaultTargetPlatformOverride = null;
    });
  });
}
