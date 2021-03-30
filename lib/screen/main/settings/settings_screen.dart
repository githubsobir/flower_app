import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  static Widget screen() => SettingsScreen();

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Settings"));
  }
}
