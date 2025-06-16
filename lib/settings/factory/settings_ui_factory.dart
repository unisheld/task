import 'package:flutter/material.dart';

abstract class SettingsUIFactory {
  Widget createHeader(String title);
  Widget createSwitch(String title, bool value, ValueChanged<bool> onChanged);
  Widget createSlider(String title, double value, ValueChanged<double> onChanged);
  Widget createSelection(String title, List<String> options, String selected, ValueChanged<String> onChanged);
  Widget createActionButton(String text, VoidCallback onPressed);
}
