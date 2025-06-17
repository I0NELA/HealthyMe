import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthyme_app/models/ingredient.dart';
import 'package:healthyme_app/views/homescreen_view.dart';
import 'package:healthyme_app/widgets/ingredient_card.dart';

class ProteinsView extends StatefulWidget {
  final List<Ingredient> proteins;
  //final Set<int> selectedIds;
  final List<Ingredient> initiallySelected;

  const ProteinsView({
    required this.proteins,
    //required this.selectedIds,
    required this.initiallySelected,
  });

  @override
  State<ProteinsView> createState() => _ProteinsViewState();
}

class _ProteinsViewState extends State<ProteinsView> {
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
    final suggestedIngredients = widget.proteins
        .where((i) => !_isSelected(i))
        .toList();

    return CupertinoPageScaffold(
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              const CupertinoSliverNavigationBar(largeTitle: Text('proteins')),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10,
                  ),
                  child: Text(
                    "Proteins primarily have a structural function,  playing a key role in all metabolic reactions, in addition to their energetic function.",
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
