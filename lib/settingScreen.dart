import 'dart:io';
import 'package:link/link.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String about = "TèP developed by Leonardo Migliorelli";
  String site = "http://www.leomiglio.com";

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Padding(
          padding: EdgeInsets.all(16),
          child: PreferencePage([
            PreferenceTitle("General"),
            DropdownPreference("Lingua", "language",
                defaultVal: "Italiano", values: ["Italiano", "English"]),
            SwitchPreference(
              'Dark Theme',
              'uiTheme',
              defaultVal: true,
              onEnable: () =>
                  DynamicTheme.of(context).setBrightness(Brightness.dark),
              onDisable: () =>
                  DynamicTheme.of(context).setBrightness(Brightness.light),
            ),
            Link(child: Text("\n\n" + about), url: site)
          ])));
}
