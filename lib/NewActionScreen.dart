import 'package:flutter/material.dart';

class NewActionScreen extends StatefulWidget {
  @override
  _NewActionScreenState createState() => _NewActionScreenState();
}

class _NewActionScreenState extends State<NewActionScreen> {
  Text titolo = Text("Nuova attività");
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: titolo),
        body: Center(),
        floatingActionButton: FloatingActionButton(
          elevation: 2,
          child: Icon(Icons.check),
          onPressed: () => addToList(),
        ),
      );
  void addToList() {
    // TODO: add to list
    Navigator.pop(context);
  }
}
