import 'package:healthyme_app/main.dart';
import 'package:objectbox/objectbox.dart';
import 'models/ingredient.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'objectbox.g.dart';

class ObjectBox {
  late final Store store;
  late final Box<Ingredient> ingreBox;

  ObjectBox._create(this.store) {
    ingreBox = Box<Ingredient>(store);
  }

  static Future<ObjectBox> create() async {
    final dir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(dir.path, 'objectbox'));
    return ObjectBox._create(store);
  }

  List<Ingredient> getCarbs() {
    final query = ingreBox.query(Ingredient_.macro.equals("carbs")).build();
    final carbs = query.find();
    query.close();
    return carbs;
  }

  List<Ingredient> getProts() {
    final query = ingreBox.query(Ingredient_.macro.equals("protein")).build();
    final proteins = query.find();
    query.close();
    return proteins;
  }

  List<Ingredient> getFats() {
    final query = objectBox.ingreBox
        .query(Ingredient_.macro.equals("fat"))
        .build();
    final fats = query.find();
    query.close();
    return fats;
  }
}

/* import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';

Future<List<List<dynamic>>> loadCsvData(String path) async {
  final data = await rootBundle.loadString(path);
  List<List<dynamic>> csvTable = const CsvToListConverter().convert(data);
  return csvTable;
}





Future<void> importDataFromCsv(Store store) async {
  final box = store.box<Person>();
  final csvData = await loadCsvData('assets/data.csv');

  for (int i = 1; i < csvData.length; i++) {
    final row = csvData[i];

    final person = Person(
      name: row[0],
      city: row[1],
      age: int.tryParse(row[2].toString()) ?? 0,
    );

    box.put(person);
  }
} */
