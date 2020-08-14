# BabelEditで編集された内容を元に、messages_*.dartファイルを生成
rm -rf lib/l10n/intl_messages.arb

flutter packages pub run intl_translation:generate_from_arb --output-dir=lib/l10n --no-use-deferred-loading lib/l10n/l10n.dart lib/l10n/intl_*.arb
