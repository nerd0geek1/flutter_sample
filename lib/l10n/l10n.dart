import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'l10n_delegate.dart';
import 'messages_all.dart';

class L10n {
  static const LocalizationsDelegate<L10n> delegate = L10nDelegate();

  static Future<L10n> load(Locale locale) async {
    final countryCode = locale.countryCode ?? '';
    final name = countryCode.isEmpty ? locale.languageCode : locale.toString();

    final localeName = Intl.canonicalizedLocale(name);

    // messages_allがmessages_*.dartから言語リソースを読み込む
    await initializeMessages(localeName);
    Intl.defaultLocale = localeName;

    return L10n();
  }

  static L10n of(BuildContext context) {
    return Localizations.of(context, L10n);
  }

  String get appTitle => Intl.message(
        'FLUTTER SAMPLER',
        name: 'appTitle',
        desc: 'Generic App Title',
      );
  String get platformMenuTitleGeneric => Intl.message(
        'GENERIC',
        name: 'platformMenuTitleGeneric',
        desc: 'UITabBar / Drawerのタイトル(一般用)',
      );
  String get platformMenuTitleDeviceSpecific => Intl.message(
        'DEVICE SPECIFIC',
        name: 'platformMenuTitleDeviceSpecific',
        desc: 'UITabBar / Drawerのタイトル(端末依存用)',
      );
  String get platformMenuTitleExternal => Intl.message(
        'EXTERNAL',
        name: 'platformMenuTitleExternal',
        desc: 'UITabBar / Drawerのタイトル(外部連携用)',
      );
}
