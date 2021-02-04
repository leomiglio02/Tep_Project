import 'package:flutter/material.dart';
import 'Activity.dart';

class ActionScreen extends StatefulWidget {
  Activity action;
  ActionScreen(this.action);
  
  @override
  _ActionScreenState createState() => _ActionScreenState(this.action);
}

class _ActionScreenState extends State<ActionScreen> {
  Activity action;
  Text titolo = Text("Attività Produttiva");

  _ActionScreenState(this.action);
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: titolo),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: <Widget>[
              TextFormField(
                initialValue: action.titolo,
                style: TextStyle(fontSize: 30),
                decoration: InputDecoration(
                  labelText: 'Titolo',
                  border: InputBorder.none,
                ),
              ),
              TextFormField(
                initialValue: action.descrizione,
                style: TextStyle(fontSize: 30),
                decoration: InputDecoration(
                  labelText: 'Descrizione',
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 2,
          child: Icon(Icons.check),
          onPressed: () => replaceAction(),
        ),
      );
  void replaceAction() {
    // TODO: replace to list
    Navigator.pop(context);
  }
}
