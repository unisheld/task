import 'package:flutter/material.dart';
import 'package:task/settings/page/settings_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Settings Demo', home: const SettingsPage());
  }
}


