import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import '../models/ingredient.dart';
import 'package:objectbox/objectbox.dart';

Future<void> loadCsvToObjectBox(Store store) async {
  final box = store.box<Ingredient>();

  if (box.isEmpty()) {
    final raw = await rootBundle.loadString(
      'lib/assets/ingredient_dataset.csv',
    );

    final List<List<dynamic>> data = CsvToListConverter().convert(
      raw,
      eol: '\n',
      shouldParseNumbers: false,
    );

    final header = data.first
        .map((e) => e.toString().trim().toLowerCase())
        .toList();
    final rows = data.skip(1);

    final nameIndex = header.indexOf('name');
    final macroIndex = header.indexOf('macro');

    if (nameIndex == -1 || macroIndex == -1) {
      print("CSV header: $header");
      throw Exception('CSV header is missing required columns');
    }

    final ingredients = rows.map<Ingredient>((row) {
      return Ingredient(
        name: row[nameIndex].toString().trim(),
        macro: row[macroIndex].toString().trim(), // already lowercase
      );
    }).toList();

    print("Parsed ingredients:");
    for (var i in ingredients) {
      print('${i.name} - ${i.macro}');
    }

    box.putMany(ingredients);
  }
}

/* 


Future<void> loadCsvToObjectBox(Store store) async {
  final box = store.box<Ingredient>();
  if (box.isEmpty()) {
    final raw = await rootBundle.loadString('assets/ingredient_dataset.csv');
    final List<List<dynamic>> data = CsvToListConverter().convert(
      raw,
      eol: '\n',
      shouldParseNumbers: false,
    );

    final rows = data.skip(1); // skip header

    final ingredients = rows.map<Ingredient>((row) {
      return Ingredient(
        name: row[0].toString().trim(),
        macro: row[4].toString().trim().toLowerCase(),
      );
    }).toList();

    box.putMany(ingredients);
  }
}
 */
