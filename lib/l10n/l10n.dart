import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'l10n_delegate.dart';

class L10n {
  static const LocalizationsDelegate<L10n> delegate = L10nDelegate();

  static Future<L10n> load(Locale locale) async {
    return L10n();
  }

  static L10n of(BuildContext context) {
    return Localizations.of(context, L10n);
  }

  String get hello => Intl.message(
        'こんにちは',
        name: 'hello',
      );
}
