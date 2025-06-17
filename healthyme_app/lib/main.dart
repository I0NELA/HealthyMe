import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthyme_app/dataset.dart';
import 'package:healthyme_app/helper.dart';
import 'models/ingredient.dart';
import 'package:healthyme_app/views/homescreen_view.dart';
import 'package:healthyme_app/views/homescreen_view.dart';
import 'package:provider/provider.dart';

late ObjectBox objectBox;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectBox = await ObjectBox.create();
  await loadCSVToObjectBox(objectBox);

  final carbs = objectBox.getCarbs();
  print(carbs);

  /* 
  WidgetsFlutterBinding.ensureInitialized();
  await initObjectBox();
  */
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
      title: 'My Flutter App', 
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
