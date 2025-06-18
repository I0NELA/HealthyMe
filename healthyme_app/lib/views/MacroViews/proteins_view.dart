import 'package:flutter/cupertino.dart';
import 'package:healthyme_app/models/ingredient.dart';
import 'package:healthyme_app/widgets/ingredient_card.dart';

class ProteinsView extends StatefulWidget {
  final List<Ingredient> proteins;
  final List<Ingredient> initiallySelected;
  final String previousPageTitle;

  const ProteinsView({
    required this.proteins,
    required this.initiallySelected,
    required this.previousPageTitle,
    Key? key,
  }) : super(key: key);

  @override
  State<ProteinsView> createState() => _ProteinsViewState();
}

class _ProteinsViewState extends State<ProteinsView> {
  late List<Ingredient> selectedIngredients;

  @override
  void initState() {
    super.initState();
    selectedIngredients = [...widget.initiallySelected];
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
    final suggestedIngredients = widget.proteins
        .where((i) => !_isSelected(i))
        .toList();

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Proteins'),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        previousPageTitle: widget.previousPageTitle,
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.pop(context, selectedIngredients); // return selection
          },
          child: const Text('Done'),
        ),
      ),
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 10,
                ),
                child: const Text(
                  "Proteins primarily have a structural function, playing a key role in all metabolic reactions, in addition to their energetic function.",
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
                  child: const Text(
                    'Selected',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                child: const Text(
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
      ),
    );
  }
}
