import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttersample/l10n/l10n.dart';
import 'package:fluttersample/presentation_layer/platform_widget.dart';
import 'package:fluttersample/presentation_layer/screen/device_specific_sample/device_specific_sample_page.dart';
import 'package:fluttersample/presentation_layer/screen/external_sample/external_sample_page.dart';
import 'package:fluttersample/presentation_layer/screen/generic_sample/generic_sample_page.dart';
import 'package:fluttersample/presentation_layer/screen/platform_menu/menu_type.dart';

class PlatformMenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildForAndroid,
      iosBuilder: _buildForIos,
    );
  }

  Widget _buildForAndroid(BuildContext context) {
    final drawer = Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _listTile(
            context,
            MenuType.generic,
            () {},
          ),
          _listTile(
            context,
            MenuType.deviceSpecific,
            () {
              Navigator.push<void>(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => DeviceSpecificSamplePage(),
                  ));
            },
          ),
          _listTile(
            context,
            MenuType.external,
            () {
              Navigator.push<void>(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ExternalSamplePage(),
                  ));
            },
          ),
        ],
      ),
    );

    return GenericSamplePage(
      drawer: drawer,
    );
  }

  Widget _buildForIos(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          _bottomItem(context, MenuType.generic),
          _bottomItem(context, MenuType.deviceSpecific),
          _bottomItem(context, MenuType.external),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (BuildContext context) => const GenericSamplePage(),
            );
          case 1:
            return CupertinoTabView(
              builder: (BuildContext context) => DeviceSpecificSamplePage(),
            );
          default:
            return CupertinoTabView(
              builder: (BuildContext context) => ExternalSamplePage(),
            );
        }
      },
    );
  }

  ListTile _listTile(
    BuildContext context,
    MenuType menuType,
    GestureTapCallback onTap,
  ) {
    return ListTile(
      leading: _icon(menuType, TargetPlatform.android),
      title: Text(_title(context, menuType)),
      onTap: onTap,
    );
  }

  BottomNavigationBarItem _bottomItem(
    BuildContext context,
    MenuType menuType,
  ) {
    return BottomNavigationBarItem(
        icon: _icon(
          menuType,
          TargetPlatform.iOS,
        ),
        title: Text(
          _title(context, menuType),
        ));
  }

  Icon _icon(
    MenuType menuType,
    TargetPlatform platform,
  ) {
    final isIos = platform == TargetPlatform.iOS;
    switch (menuType) {
      case MenuType.generic:
        return isIos ? const Icon(CupertinoIcons.collections) : const Icon(Icons.list);
      case MenuType.deviceSpecific:
        return isIos ? const Icon(CupertinoIcons.location) : const Icon(Icons.android);
      case MenuType.external:
        return isIos ? const Icon(CupertinoIcons.search) : const Icon(Icons.public);
      default:
        return const Icon(Icons.device_unknown);
    }
  }

  String _title(
    BuildContext context,
    MenuType menuType,
  ) {
    switch (menuType) {
      case MenuType.generic:
        return L10n.of(context).platformMenuTitleGeneric;
      case MenuType.deviceSpecific:
        return L10n.of(context).platformMenuTitleDeviceSpecific;
      case MenuType.external:
        return L10n.of(context).platformMenuTitleExternal;
      default:
        return '';
    }
  }
}
