import 'package:flutter/material.dart';
import 'package:task/settings/factory/cupertino_settings_ui_factory.dart';
import 'package:task/settings/factory/custom_settings_ui_factory.dart';
import '../builder/settings_screen_builder.dart';
import '../factory/material_settings_ui_factory.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;
  double volume = 50;
  String language = 'English';

  @override
  Widget build(BuildContext context) {
    final factory = MaterialSettingsUIFactory();
    //final factory = CupertinoSettingsUIFactory();
    //final factory = CustomSettingsUIFactory();
    final builder = SettingsScreenBuilder(factory);

    builder.addHeader('Настройки');
    builder.addSwitchSetting('Тёмная тема', isDarkMode, (value) {
      setState(() {
        isDarkMode = value;
      });
    });
    builder.addSliderSetting('Громкость', volume, (value) {
      setState(() {
        volume = value;
      });
    });
    builder.addSelectionSetting(
  'Язык',
  ['English', 'Русский', 'Deutsch'],
  language,
  (value) {
    setState(() {
      language = value;
    });
  },
);

    builder.addActionButton('Сохранить', () {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Настройки сохранены!')));
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Экран настроек')),
      body: builder.build(),
    );
  }
}