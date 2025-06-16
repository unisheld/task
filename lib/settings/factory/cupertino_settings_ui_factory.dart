import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'settings_ui_factory.dart';

class CupertinoSettingsUIFactory implements SettingsUIFactory {
  @override
  Widget createHeader(String title) => Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      );

  @override
  Widget createSwitch(String title, bool value, ValueChanged<bool> onChanged) => Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            CupertinoSwitch(value: value, onChanged: onChanged),
          ],
        ),
      );

  @override
  Widget createSlider(String title, double value, ValueChanged<double> onChanged) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            CupertinoSlider(value: value, onChanged: onChanged, min: 0, max: 100),
          ],
        ),
      );

  @override
  Widget createSelection(
    String title,
    List<String> options,
    String selected,
    ValueChanged<String> onChanged,
  ) {
    return Builder(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              const SizedBox(height: 8),
              CupertinoButton.filled(
                child: Text(selected),
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (_) => SizedBox(
                      height: 250,
                      child: CupertinoPicker(
                        itemExtent: 40,
                        scrollController: FixedExtentScrollController(
                          initialItem: options.indexOf(selected),
                        ),
                        onSelectedItemChanged: (index) {
                          onChanged(options[index]);
                        },
                        children: options.map((e) => Center(child: Text(e))).toList(),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget createActionButton(String text, VoidCallback onPressed) => Center(
        child: CupertinoButton.filled(
          onPressed: onPressed,
          child: Text(text),
        ),
      );
}
