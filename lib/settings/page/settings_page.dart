import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:task/settings/factory/cupertino_settings_ui_factory.dart';
import 'package:task/settings/builder/settings_screen_builder.dart';
import 'package:task/settings/factory/custom_settings_ui_factory.dart';
import 'package:task/settings/factory/material_settings_ui_factory.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;
  double volume = 50;
  late String language;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    language = _getLanguageLabel(context.locale);
  }

  @override
  Widget build(BuildContext context) {
    final factory = CustomSettingsUIFactory();
    //final factory = MaterialSettingsUIFactory();
    //final factory = CupertinoSettingsUIFactory();
    final builder = SettingsScreenBuilder(factory);


    builder.addHeader('settings');

    builder.addSwitchSetting('dark_mode', isDarkMode, (value) {
      setState(() {
        isDarkMode = value;
      });
    });

    builder.addSliderSetting('volume', volume, (value) {
      setState(() {
        volume = value;
      });
    });

    builder.addSelectionSetting(
      'language',
      ['english', 'russian', 'german'],
      language,
      (value) async {
        Locale newLocale;
        if (value == 'english') {
          newLocale = const Locale('en');
        } else if (value == 'russian') {
          newLocale = const Locale('ru');
        } else if (value == 'german') {
          newLocale = const Locale('de');
        } else {
          newLocale = context.locale;
        }

        await context.setLocale(newLocale);

        setState(() {
          language = _getLanguageLabel(context.locale);
        });
      },
    );

    builder.addActionButton('save', () {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('settings_saved'.tr())),
      );
    });

    return Scaffold(
      appBar: AppBar(title: Text('settings_screen'.tr())),
      body: builder.build(),
    );
  }

  String _getLanguageLabel(Locale locale) {
    switch (locale.languageCode) {
      case 'ru':
        return 'russian';
      case 'de':
        return 'german';
      case 'en':
      default:
        return 'english';
    }
  }
}
