import 'dart:html';
import 'dart:io';
import 'package:link/link.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class settingScreen extends StatefulWidget {
  @override
  _settingScreenState createState() => _settingScreenState();
}

class _settingScreenState extends State<settingScreen> {
  String about = "TèP developed by Leonardo Migliorelli";
  String site = "http://www.leomiglio.com";
  bool enabled = false;// TODO fai funzionare ilcheckbox


  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  CheckboxListTile(
                    value: enabled,
                    title: Text("This is a CheckBoxPreference"),
                    onChanged: (value) => setState(() => enabled = value),
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
