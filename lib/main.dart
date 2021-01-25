import 'package:flutter/material.dart';
import 'package:sembast/sembast.dart';
import 'Things.dart';

// se c'è un problema con la compilazione xcode eseguire questo codice xattr -cr build/ios/Debug-iphone[simulator o os] 
// simulator se si testa in un simulatore
// os se si testa in un dispositivo

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'TèP', debugShowCheckedModeBanner: true, home: TepHomePage());
}

class TepHomePage extends StatefulWidget {
  @override
  _TepHomePageState createState() => _TepHomePageState();
}

class _TepHomePageState extends State<TepHomePage> {
  List<Things> thing = new List<Things>();

  @override
  void initState() {
    getDB();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text("TèP"), actions: [
          IconButton(icon: Icon(Icons.settings), onPressed: () => settingsBtn())
        ]),
        body: ListView.builder(
            itemCount: thing.length,
            itemBuilder: ((BuildContext context, int posizione) => Card(
                elevation: 2,
                child: ListTile(
                    title: Text(thing[posizione].titolo),
                    subtitle: Text(thing[posizione].text))))),
      );

  //addToList() {};
  settingsBtn() => {}; //TepHomePage();
  void getDB() {
    thing = [Things("Esempio Titolo", "Esempio Testo")]; // TODO completa con la connessione al database
    setState(() => thing = thing);
  }
}
// TODO settings page
/*
class TepSettingsPage extends StatefulWidget {
  @override
  _TepSettingsPageState createState() => _TepSettingsPageState();
}

class _TepSettingsPageState extends State<TepHomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        actions: [IconButton(icon: null, onPressed: null)],
      ),
      body: Center());
}*/

ColorScheme tepColorScheme = ColorScheme(
  primary: Colors.blue[500], //or 25,118,210
  onPrimary: Colors.black,
  primaryVariant: Colors.blue[700],

  secondary: Colors.red[600],
  onSecondary: Colors.black,
  secondaryVariant: Colors.red[900],

  surface: Colors.white,
  onSurface: Colors.black,

  background: Colors.white,
  onBackground: Colors.black,

  error: Color(0xFFB00020),
  onError: Colors.white,
  brightness: Brightness.light,
);
