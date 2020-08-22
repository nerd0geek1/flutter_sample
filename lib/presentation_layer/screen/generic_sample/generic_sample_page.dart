import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttersample/l10n/l10n.dart';
import 'package:fluttersample/presentation_layer/platform_widget.dart';

class GenericSamplePage extends StatelessWidget {
  const GenericSamplePage({
    this.drawer,
  });

  final Drawer drawer;

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildForAndroid,
      iosBuilder: _buildForIos,
    );
  }

  Widget _buildForAndroid(BuildContext context) {
    assert(drawer != null);

    return Scaffold(
      appBar: AppBar(
        title: _navigationTitleText(context),
      ),
      drawer: drawer,
    );
  }

  Widget _buildForIos(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CupertinoSliverNavigationBar(
          largeTitle: _navigationTitleText(context),
        ),
      ],
    );
  }

  Text _navigationTitleText(BuildContext context) {
    return Text(L10n.of(context).appTitle);
  }
}
