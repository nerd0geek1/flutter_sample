import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttersample/l10n/l10n.dart';
import 'package:fluttersample/presentation_layer/platform_widget.dart';

enum GenericSampleTileType { renderShape }

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
      body: _listView(context),
    );
  }

  Widget _buildForIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: _navigationTitleText(context),
      ),
      child: _listView(context),
    );
  }

  Widget _listView(BuildContext context) {
    return ListView(
      children: [
        _listTile(context, GenericSampleTileType.renderShape, () {}),
      ],
    );
  }

  Widget _listTile(BuildContext context, GenericSampleTileType tileType, GestureTapCallback onTap) {
    var title = '';
    switch (tileType) {
      case GenericSampleTileType.renderShape:
        title = L10n.of(context).pageTitleRenderShape;
    }

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        child: ListTile(
          title: Text(title),
          onTap: onTap,
        ),
      ),
    );
  }

  Text _navigationTitleText(BuildContext context) {
    return Text(L10n.of(context).appTitle);
  }
}
