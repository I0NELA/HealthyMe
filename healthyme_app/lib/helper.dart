import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'dataset.dart';
import 'package:healthyme_app/models/ingredient.dart';

Future<void> loadCSVToObjectBox(ObjectBox objectBox) async {
  if (objectBox.ingreBox.count() > 0) return; // load once only

  final raw = await rootBundle.loadString('lib/assets/ingredient_dataset.csv');
  final List<List<dynamic>> data = CsvToListConverter().convert(raw);

  for (int i = 1; i < data.length; i++) {
    final name = data[i][0].toString();
    final macro = data[i][4].toString();

    //int.tryParse(data[i][1].toString()) ?? 0;
    objectBox.ingreBox.put(Ingredient(name: name, macro: macro));
    //, imageUrl: ''
  }
}
