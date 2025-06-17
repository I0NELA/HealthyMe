import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthyme_app/objectbox_store.dart';
import 'package:healthyme_app/views/homescreen_view.dart';
import 'package:healthyme_app/views/homescreen_view.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initObjectBox();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
       theme: CupertinoThemeData(
        primaryColor: Color.fromARGB(255, 145, 199, 136),
      ),
      title: 'My Flutter App', // <-- This is the app title
      home: HomeScreen(),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      body: Column(
        // children: [Text('A random idea:'), Text(appState.current.asLowerCase)],
      ),
    );
  }
}
