import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:healthyme_app/dataset.dart';
import 'package:healthyme_app/helper.dart';
import 'package:healthyme_app/views/homescreen_view.dart';

late ObjectBox objectBox;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectBox = await ObjectBox.create();
  await loadCSVToObjectBox(objectBox);
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
