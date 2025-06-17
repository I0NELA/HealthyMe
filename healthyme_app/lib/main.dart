import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthyme_app/dataset.dart';
import 'package:healthyme_app/helper.dart';
import 'package:healthyme_app/objectbox.g.dart';
import 'package:healthyme_app/providers/ingredient_provider.dart';
import 'models/ingredient.dart';
import 'package:healthyme_app/views/homescreen_view.dart';
import 'package:healthyme_app/views/homescreen_view.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';

late ObjectBox objectBox;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  store = await openStore(directory: dir.path);

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
  /* objectBox = await ObjectBox.create();
  //await loadCSVToObjectBox(objectBox);
  final store = await openStore();
  final carbs = objectBox.getCarbs();
  print(carbs); */

  /* 
  WidgetsFlutterBinding.ensureInitialized();
  await initObjectBox();
  */
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
