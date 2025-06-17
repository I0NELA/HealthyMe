/* import 'package:healthyme_app/models/ingredient.dart';
import 'package:healthyme_app/objectbox.g.dart';

class IngredientRepository {
  final Box<Ingredient> ingredientBox;

  Future<void> loadIngredientsFromCsv(String path) async {
    final csvString = await rootBundle.loadString(path);
    final rows = const CsvToListConverter().convert(csvString, eol: '\n');

    // Assuming first row is headers
    final dataRows = rows.skip(1);

    allIngredients = dataRows.map((row) {
      return Ingredient(
        id: row[0] as int,
        name: row[1] as String,
        type: row[2] as String, // carbs, fats, proteins
        calories: row[3] as int,
      );
    }).toList();
  }


/* 
  List<Ingredient> _carbs = [];
  List<Ingredient> _proteins = [];
  List<Ingredient> _fats = [];

  IngredientRepository(this.ingredientBox);

  Future<void> loadIngredients() async {
    // Run query ONCE
    final allIngredients = ingredientBox.getAll();
 */
    // Separate them into views
    _carbs = allIngredients.where((i) => i.macro == 'carb').toList();
    _proteins = allIngredients.where((i) => i.macro == 'protein').toList();
    _fats = allIngredients.where((i) => i.macro == 'fat').toList();
  }

  List<Ingredient> get carbs => _carbs;
  List<Ingredient> get proteins => _proteins;
  List<Ingredient> get fats => _fats;
}
 */
