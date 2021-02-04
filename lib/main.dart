import 'package:flutter/material.dart';
//import 'package:sembast/sembast.dart';
//import 'package:sembast/sembast_io.dart';
//import 'package:path/path.dart';
import 'package:preferences/preferences.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

import 'SettingScreen.dart';
import 'NewActionScreen.dart';
import 'ActionScreen.dart';
import 'Activity.dart';

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
  List<Activity> actions = new List<Activity>();
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
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => SettingScreen())),
          )
        ]),
        body: ListView.builder(
          itemCount: actions.length,
          itemBuilder: ((BuildContext context, int i) => Card(
                elevation: 2,
                child: ListTile(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ActionScreen(actions[i]))),
                  title: Text(actions[i].titolo),
                  subtitle: Text(actions[i].descrizione),
                ),
              )),
        ),
        floatingActionButton: FloatingActionButton(
            elevation: 2,
            child: Icon(Icons.add),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewActionScreen(),
                ))),
      );

  //addToList() {};

  void addDB() async {}
  void setDB() async {}

  void getDB() async {
    actions = [
      Activity("Esempio Titolo", "Esempio Testo")
    ]; // TODO: completa con la connessione al database
    setState(() => actions = actions);
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
