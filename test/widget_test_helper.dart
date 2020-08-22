import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttersample/l10n/l10n.dart';

class WidgetTestHelper {
  static Widget wrapWithMaterialAppAndLocalization(Widget widget) {
    return MaterialApp(
      localizationsDelegates: const [
        L10n.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: widget,
    );
  }
}
