import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/cupertino.dart';

class AppLocale {
  Locale locale;
  Map<String, String> _loadedLocalizedValues = {};
  static late Locale currentLocale;

  AppLocale(this.locale) {
    currentLocale = locale;
  }

  static const Iterable<Locale> supportedLocales = [
    Locale('en'),
    Locale('ar'),
    Locale('tr'),
  ];

  static const LocalizationsDelegate<AppLocale> delegate = _AppLocalDelegate();

  static const Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    DefaultCupertinoLocalizations.delegate
  ];
  static Locale? localeResolutionCallback(Locale? locale, Iterable<Locale>? supportedLocales) {
    for (Locale supportedLocale in supportedLocales!) {
      if (supportedLocale.languageCode == locale!.languageCode && supportedLocale.countryCode == locale.countryCode) {
        return supportedLocale;
      }
    }
    return supportedLocales.first;
  }

  static AppLocale of(BuildContext context) => Localizations.of(context, AppLocale);

  String? getTranslated(String key) => _loadedLocalizedValues[key];

  Future loadLang() async {
    String _langFile = await rootBundle.loadString('assets/lang/${locale.languageCode}.json');
    Map<String, dynamic> _loadedValues = jsonDecode(_langFile);
    _loadedLocalizedValues = _loadedValues.map((key, value) => MapEntry(key, value.toString()));
  }
}

class _AppLocalDelegate extends LocalizationsDelegate<AppLocale> {
  const _AppLocalDelegate();
  @override
  bool isSupported(Locale locale) {
    return ["en", "ar", "tr"].contains(locale.languageCode);
  }

  @override
  Future<AppLocale> load(Locale locale) async {
    AppLocale appLocale = AppLocale(locale);
    await appLocale.loadLang();
    return appLocale;
  }

  @override
  bool shouldReload(_AppLocalDelegate old) => false;
}

extension translate on BuildContext {
  /// Translate the given key to the current locale
  String tr(String key) {
    return AppLocale.of(this).getTranslated(key) ?? key;
  }
}
