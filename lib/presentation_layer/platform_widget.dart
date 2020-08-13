import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformWidget extends StatelessWidget {
  const PlatformWidget({
    Key key,
    this.targetPlatform,
    @required this.androidBuilder,
    @required this.iosBuilder,
  }) : super(key: key);

  final TargetPlatform targetPlatform;
  final WidgetBuilder androidBuilder;
  final WidgetBuilder iosBuilder;

  @override
  Widget build(BuildContext context) {
    final platform = targetPlatform ?? Theme.of(context).platform;

    switch (platform) {
      case TargetPlatform.android:
        return androidBuilder(context);
      case TargetPlatform.iOS:
        return iosBuilder(context);
      default:
        throw UnsupportedError('Unexpected platform $defaultTargetPlatform');
    }
  }
}
