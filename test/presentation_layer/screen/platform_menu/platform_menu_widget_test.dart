import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttersample/presentation_layer/screen/generic_sample/generic_sample_page.dart';
import 'package:fluttersample/presentation_layer/screen/platform_menu/platform_menu_widget.dart';

import '../../../widget_test_helper.dart';

void main() {
  group('PlatformMenuWidget', () {
    testWidgets('when platform is iOS, it will return a widget which contains CupertinoTabScaffold',
        (WidgetTester tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      await tester.pumpWidget(WidgetTestHelper.wrapWithMaterialAppAndLocalization(PlatformMenuWidget()));
      await tester.pumpAndSettle();

      final cupertinoTabScaffoldFinder = find.byType(CupertinoTabScaffold);
      final cupertinoTabBarFinder =
          find.byWidgetPredicate((Widget widget) => widget is CupertinoTabScaffold && widget.tabBar.items.length == 3);

      expect(cupertinoTabScaffoldFinder, findsOneWidget);
      expect(cupertinoTabBarFinder, findsOneWidget);

      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets('when platform is Android, it will return GenericSamplePage which drawer is not null',
        (WidgetTester tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      await tester.pumpWidget(WidgetTestHelper.wrapWithMaterialAppAndLocalization(PlatformMenuWidget()));
      await tester.pumpAndSettle();

      final rootPageFinder = find.byType(GenericSamplePage);
      final drawerExistsFinder =
          find.byWidgetPredicate((Widget widget) => widget is GenericSamplePage && widget.drawer != null);

      expect(rootPageFinder, findsOneWidget);
      expect(drawerExistsFinder, findsOneWidget);
      debugDefaultTargetPlatformOverride = null;
    });
  });
}
