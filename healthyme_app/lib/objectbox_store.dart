// objectbox_store.dart
import 'package:path_provider/path_provider.dart';
import 'objectbox.g.dart';

late final Store store;

Future<void> initObjectBox() async {
  final dir = await getApplicationDocumentsDirectory();
  store = await openStore(directory: '${dir.path}/objectbox');
}