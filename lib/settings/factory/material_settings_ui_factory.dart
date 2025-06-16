import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'settings_ui_factory.dart';

class MaterialSettingsUIFactory implements SettingsUIFactory {
  @override
  Widget createHeader(String title) => Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          title.tr(),
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      );

  @override
  Widget createSwitch(String title, bool value, ValueChanged<bool> onChanged) =>
      SwitchListTile(
        title: Text(title.tr()),
        value: value,
        onChanged: onChanged,
      );

  @override
  Widget createSlider(String title, double value, ValueChanged<double> onChanged) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(title.tr()),
          ),
          Slider(value: value, onChanged: onChanged, min: 0, max: 100),
        ],
      );

  @override
  Widget createSelection(
    String title,
    List<String> options,
    String selected,
    ValueChanged<String> onChanged,
  ) =>
      Padding(
        padding: const EdgeInsets.all(16),
        child: DropdownButtonFormField<String>(
          value: selected,
          decoration: InputDecoration(labelText: title.tr()),
          items: options
              .map((o) => DropdownMenuItem(value: o, child: Text(o.tr())))
              .toList(),
          onChanged: (value) {
            if (value != null) onChanged(value);
          },
        ),
      );

  @override
  Widget createActionButton(String text, VoidCallback onPressed) => Center(
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(text.tr()),
        ),
      );
}
