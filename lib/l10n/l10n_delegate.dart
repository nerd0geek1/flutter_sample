import 'package:flutter/widgets.dart';

import 'l10n.dart';

class L10nDelegate extends LocalizationsDelegate<L10n> {
  const L10nDelegate();

  @override
  // isSupportedがfalseを返していると、Localizations.of(context, L10n)はnullになる
  // localeについては、MaterialApp.supportedLocalesで適用されたもののみが渡ってきうる
  bool isSupported(Locale locale) => ['ja', 'en'].contains(locale.languageCode);

  @override
  Future<L10n> load(Locale locale) => L10n.load(locale);

  @override
  bool shouldReload(covariant LocalizationsDelegate<L10n> old) {
    return true;
  }
}
