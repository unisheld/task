// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _de = {
  "settings": "Einstellungen",
  "dark_mode": "Dunkler Modus",
  "volume": "Lautstärke",
  "language": "Sprache",
  "english": "Englisch",
  "russian": "Russisch",
  "german": "Deutsch",
  "save": "Speichern",
  "settings_saved": "Einstellungen gespeichert",
  "settings_screen": "Einstellungsbildschirm"
};
static const Map<String,dynamic> _en = {
  "settings": "Settings",
  "dark_mode": "Dark Mode",
  "volume": "Volume",
  "language": "Language",
  "english": "English",
  "russian": "Russian",
  "german": "German",
  "save": "Save",
  "settings_saved": "Settings saved!",
  "settings_screen": "Settings Screen"
};
static const Map<String,dynamic> _ru = {
  "settings": "Настройки",
  "dark_mode": "Темная тема",
  "volume": "Громкость",
  "language": "Язык",
  "english": "English",
  "russian": "Русский",
  "german": "Немецкий",
  "save": "Сохранить",
  "settings_saved": "Настройки сохранены!",
  "settings_screen": "Настройки страницы"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"de": _de, "en": _en, "ru": _ru};
}
