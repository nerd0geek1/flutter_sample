import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttersample/presentation_layer/platform_widget.dart';

void main() {
  group('PlatformWidget', () {
    testWidgets('when platform is iOS, it will return Widget for iOS', (WidgetTester tester) async {
      await tester.pumpWidget(const TestWidget(TargetPlatform.iOS));

      final buttonFinder = find.byType(CupertinoButton);

      expect(buttonFinder, findsOneWidget);
    });

    testWidgets('when platform is Android, it will return Widget for Android', (WidgetTester tester) async {
      await tester.pumpWidget(const TestWidget(TargetPlatform.android));

      final buttonFinder = find.byType(MaterialButton);

      expect(buttonFinder, findsOneWidget);
    });

    testWidgets('when platform is not iOS nor Android, it will throw UnsupportedError', (WidgetTester tester) async {
      await tester.pumpWidget(const TestWidget(TargetPlatform.linux));

      expect(tester.takeException(), isInstanceOf<UnsupportedError>());
    });
  });
}

class TestWidget extends StatelessWidget {
  const TestWidget(this.targetPlatform);

  final TargetPlatform targetPlatform;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: PlatformWidget(
      targetPlatform: targetPlatform,
      androidBuilder: _buildAndroidWidget,
      iosBuilder: _buildIosWidget,
    ));
  }

  Widget _buildAndroidWidget(BuildContext context) => const MaterialButton(onPressed: null);
  Widget _buildIosWidget(BuildContext context) => const CupertinoButton(child: Text('test'), onPressed: null);
}
