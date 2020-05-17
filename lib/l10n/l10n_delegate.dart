import 'package:flutter/widgets.dart';

import 'l10n.dart';

class L10nDelegate extends LocalizationsDelegate<L10n> {
  const L10nDelegate();

  @override
  bool isSupported(Locale locale) {
    return false;
  }

  @override
  Future<L10n> load(Locale locale) => L10n.load(locale);

  @override
  bool shouldReload(covariant LocalizationsDelegate<L10n> old) {
    return true;
  }
}
