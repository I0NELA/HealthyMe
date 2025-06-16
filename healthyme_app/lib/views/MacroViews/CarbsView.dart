
import 'package:healthyme_app/models/ingredient.dart';
import 'package:healthyme_app/models/selectedingredient.dart';
import 'package:healthyme_app/widgets/IngredientCard.dart';
import 'package:flutter/material.dart';
import 'package:healthyme_app/objectbox.g.dart';
import 'package:healthyme_app/objectbox_store.dart';

class CarbsView extends StatefulWidget{
  @override
  CarbsViewState createState() => CarbsViewState();

}
class CarbsViewState extends State<CarbsView> {
  late Box<Ingredient> ingredientBox;
  late Box<SelectedIngredient> selectedBox;

  List<Ingredient> ingredients = [];
  Set<int> selectedIds = {}; // store selected ingredient IDs

  @override
  void initState() {
    super.initState();
    ingredientBox = store.box<Ingredient>();
    selectedBox = store.box<SelectedIngredient>();
    loadIngredients();
  }

    void loadIngredients() {
    final allIngredients = ingredientBox.getAll();
    final allSelected = selectedBox.getAll();
    setState(() {
      ingredients = allIngredients;
     selectedIds = allSelected.map((s) => s.ingredientId).toSet();


    });
  }

  void toggleIngredient(Ingredient ingredient) {
    final isSelected = selectedIds.contains(ingredient.id);
    if (isSelected) {
      // Remove from selected
      final selectedEntry = selectedBox
          .query(SelectedIngredient_.ingredientId.equals(ingredient.id))
          .build()
          .findFirst();
      if (selectedEntry != null) selectedBox.remove(selectedEntry.id);
    } else {
      // Add to selected
      selectedBox.put(SelectedIngredient(ingredientId: ingredient.id));
    }

    loadIngredients(); // Refresh UI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ingredients')),
      body: ingredients.isEmpty
          ? Center(child: Text("No ingredients found."))
          : ListView.builder(
              itemCount: ingredients.length,
              itemBuilder: (context, index) {
                final ingredient = ingredients[index];
                final isAdded = selectedIds.contains(ingredient.id);
                return IngredientCard(
                  ingredient: ingredient,
                  isAdded: isAdded,
                  onToggle: () => toggleIngredient(ingredient),
                );
                
              },
            ),
    );
  }







}




