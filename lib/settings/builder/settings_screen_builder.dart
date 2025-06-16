import 'package:flutter/widgets.dart';
import '../factory/settings_ui_factory.dart';

class SettingsScreenBuilder {
  final SettingsUIFactory factory;
  final List<Widget> _items = [];

  SettingsScreenBuilder(this.factory);

  void addHeader(String title) => _items.add(factory.createHeader(title));

  void addSwitchSetting(String title, bool value, ValueChanged<bool> onChanged) =>
      _items.add(factory.createSwitch(title, value, onChanged));

  void addSliderSetting(String title, double value, ValueChanged<double> onChanged) =>
      _items.add(factory.createSlider(title, value, onChanged));

  void addSelectionSetting(String title, List<String> options,String selected, ValueChanged<String> onChanged) =>
      _items.add(factory.createSelection(title, options, selected, onChanged));

  void addActionButton(String text, VoidCallback onPressed) =>
      _items.add(factory.createActionButton(text, onPressed));

  Widget build() => ListView(children: _items);
}
