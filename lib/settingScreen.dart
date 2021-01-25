import 'dart:io';
import 'package:link/link.dart';
import 'package:flutter/material.dart';

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
      body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  CheckboxListTile(
                    value: true,
                    title: Text("This is a CheckBoxPreference"),
                    onChanged: (value) {},
                  ),
                  SwitchListTile(
                    value: false,
                    title: Text("This is a SwitchPreference"),
                    onChanged: (value) {},
                  ),
                  Spacer(),
                  Link(child: Text(about), url: site)
                ],
              ))));
}
