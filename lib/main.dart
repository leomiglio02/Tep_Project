import 'package:flutter/material.dart';
//import 'package:sembast/sembast.dart';
//import 'package:sembast/sembast_io.dart';
//import 'package:path/path.dart';
import 'package:preferences/preferences.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

import 'SettingScreen.dart';
import 'Things.dart';

// se c'è un problema con la compilazione xcode eseguire questo codice xattr -cr build/ios/Debug-iphone[simulator o os]
// simulator se si testa in un simulatore
// os se si testa in un dispositivo

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefService.init(prefix: 'pref_');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) => ThemeData(
            brightness: brightness, accentColor: tepColorScheme.primary),
        themedWidgetBuilder: (context, theme) => MaterialApp(
          title: 'TèP',
          theme: theme,
          home: TepHomePage(),
        ),
      );
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
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => settingsPageNavigator(),
          )
        ]),
        body: ListView.builder(
          itemCount: thing.length,
          itemBuilder: ((BuildContext context, int posizione) => Card(
                elevation: 2,
                child: ListTile(
                  title: Text(thing[posizione].titolo),
                  subtitle: Text(thing[posizione].text),
                ),
              )),
        ),
      );

  //addToList() {};
  void settingsPageNavigator() => Navigator.push(
      context, MaterialPageRoute(builder: (context) => SettingScreen()));

  void addDB() async {}
  void setDB() async {}

  void getDB() async {
    thing = [
      Things("Esempio Titolo", "Esempio Testo")
    ]; // TODO: completa con la connessione al database
    setState(() => thing = thing);
  }
}

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
