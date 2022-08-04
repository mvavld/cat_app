import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static String _getFormattedString(String string, List<String> inserts) {
    var newString = string;
    for (final insert in inserts) {
      newString = newString.replaceFirst(r'{$}', insert);
    }
    return newString;
  }

  Map<String, String> _localizedStrings = {};

  Future<bool> load() async {
    String? jsonString;
    try {
      jsonString = await rootBundle
          .loadString('assets/i18n/${locale.languageCode}.json');
    } catch (e) {}
    if (jsonString != null) {
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;

      _localizedStrings = jsonMap.map((key, dynamic value) {
        return MapEntry(key, value.toString());
      });
    }

    return true;
  }

  String get cats => _localizedStrings['cats'] ?? '';
  String get catsNetwork => _localizedStrings['catsNetwork'] ?? '';
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['ru', 'en'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
