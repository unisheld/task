import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'settings_ui_factory.dart';

class CupertinoSettingsUIFactory implements SettingsUIFactory {
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
      Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title.tr()),
            CupertinoSwitch(value: value, onChanged: onChanged),
          ],
        ),
      );

  @override
  Widget createSlider(String title, double value, ValueChanged<double> onChanged) =>
      Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title.tr()),
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
            Text(title.tr()),
            const SizedBox(height: 8),
            CupertinoButton.filled(
              child: Text(selected.tr()),
              onPressed: () {
                int selectedIndex = options.indexOf(selected);

                showCupertinoModalPopup(
                  context: context,
                  builder: (_) => Container(
                    height: 300,
                    color: Colors.white,
                    child: SafeArea(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CupertinoButton(
                                  child: Text('Cancel'.tr()),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                CupertinoButton(
                                  child: Text('Done'.tr()),
                                  onPressed: () {
                                    onChanged(options[selectedIndex]);
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: CupertinoPicker(
                              backgroundColor: Colors.white,
                              itemExtent: 40,
                              scrollController:
                                  FixedExtentScrollController(initialItem: selectedIndex),
                              onSelectedItemChanged: (int index) {
                                selectedIndex = index;
                              },
                              children: options
                                  .map((e) => Center(child: Text(e.tr())))
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
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
          child: Text(text.tr()),
        ),
      );
}
