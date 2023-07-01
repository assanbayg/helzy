import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'motto': 'Stay Helzy with us!',
      'hello': 'Hello, {name}!',
      'start': 'Start',
      'haveAccount': 'I have an account'
    },
    'kk': {
      'motto': 'Бізбен бірге дені сау болыңыз!',
      'hello': 'Сәлеметсіз бе, {name}!',
      'start': 'Тіркелу',
      'haveAccount': 'Менде аккаунт бар'
    },
    'ru': {
      'motto': 'На русском',
      'hello': 'Здравствуйте, {name}!',
    },
  };

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String? translate(String key, {Map<String, String>? params}) {
    var translation = _localizedValues[locale.languageCode]?[key];
    if (translation == null) {
      return key;
    }
    if (params != null) {
      params.forEach((key, value) {
        translation = translation?.replaceAll('{$key}', value);
      });
    }
    return translation;
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'kk', 'ru'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
