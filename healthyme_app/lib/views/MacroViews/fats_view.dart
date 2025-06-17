import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthyme_app/models/ingredient.dart';
import 'package:healthyme_app/views/homescreen_view.dart';
import 'package:healthyme_app/widgets/ingredient_card.dart';

class FatsView extends StatefulWidget {
  final List<Ingredient> fats;
  //final Set<int> selectedIds;
  final List<Ingredient> initiallySelected;
  final String previousPageTitle;

  const FatsView({
    required this.fats,
    //required this.selectedIds,
    required this.initiallySelected,
    required this.previousPageTitle,
  });

  @override
  State<FatsView> createState() => _FatsViewState();
}

class _FatsViewState extends State<FatsView> {
  late List<Ingredient> selectedIngredients;

  @override
  void initState() {
    super.initState();
    selectedIngredients = [...widget.initiallySelected]; // clone to local
    print(selectedIngredients);
  }

  void toggleIngredient(Ingredient ingredient) {
    setState(() {
      if (_isSelected(ingredient)) {
        selectedIngredients.removeWhere((i) => i.id == ingredient.id);
      } else {
        selectedIngredients.add(ingredient);
      }
    });
  }

  bool _isSelected(Ingredient ingredient) {
    return selectedIngredients.any((i) => i.id == ingredient.id);
  }

  @override
  Widget build(BuildContext context) {
    // Filter out selected from suggested
    final suggestedIngredients = widget.fats
        .where((i) => !_isSelected(i))
        .toList();

    return CupertinoPageScaffold(
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              CupertinoSliverNavigationBar(
                largeTitle: const Text('Fats'),
                previousPageTitle: widget.previousPageTitle,
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10,
                  ),
                  child: Text(
                    "Fats provide essential fatty acids, energy, and help the body absorb vitamins, playing a role in hormone production.",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              if (selectedIngredients.isNotEmpty) ...[
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 10,
                    ),
                    child: Text(
                      'Selected',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final ingredient = selectedIngredients[index];
                  return IngredientCard(
                    ingredient: ingredient,
                    isAdded: true,
                    onToggle: () => toggleIngredient(ingredient),
                  );
                }, childCount: selectedIngredients.length),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10,
                  ),
                  child: Text(
                    'Suggested',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final ingredient = suggestedIngredients[index];
                  return IngredientCard(
                    ingredient: ingredient,
                    isAdded: false,
                    onToggle: () => toggleIngredient(ingredient),
                  );
                }, childCount: suggestedIngredients.length),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 100)),
            ],
          ),
          Positioned(
            bottom: 90,
            left: 0,
            right: 0,
            child: CupertinoButton.filled(
              onPressed: () {
                Navigator.pop(context, selectedIngredients); // return selection
              },
              child: const Text('Next'),
            ),
          ),
        ],
      ),
    );
  }
}
