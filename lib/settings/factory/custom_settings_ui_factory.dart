import 'package:flutter/material.dart';
import 'package:task/settings/factory/settings_ui_factory.dart';


class CustomSettingsUIFactory implements SettingsUIFactory {
  @override
  Widget createHeader(String title) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: const Color.fromARGB(255, 175, 223, 203),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w800,
          color: Color.fromARGB(255, 109, 190, 143),
        ),
      ),
    );
  }

  @override
  Widget createSwitch(String title, bool value, ValueChanged<bool> onChanged) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(12),
      child: ListTile(
        title: Text(title),
        trailing: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: const Color.fromARGB(255, 126, 175, 146),
        ),
      ),
    );
  }

  @override
  Widget createSlider(
    String title,
    double value,
    ValueChanged<double> onChanged,
  ) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Slider(
              value: value,
              onChanged: onChanged,
              min: 0,
              max: 100,
              activeColor: const Color.fromARGB(255, 126, 175, 146),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget createSelection(
    String title,
    List<String> options,
    String selected,
    ValueChanged<String> onChanged,
  ) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            DropdownButton<String>(
              value: selected,
              isExpanded: true,
              items: options
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  onChanged(value);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget createActionButton(String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 173, 223, 167),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
