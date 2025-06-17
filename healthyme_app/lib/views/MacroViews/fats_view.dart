import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthyme_app/models/ingredient.dart';
import 'package:healthyme_app/providers/ingredient_provider.dart';
import 'package:healthyme_app/widgets/ingredient_card.dart';

class FatsView extends ConsumerStatefulWidget {
  final List<Ingredient> initiallySelected;

  const FatsView({Key? key, required this.initiallySelected}) : super(key: key);

  @override
  ConsumerState<FatsView> createState() => _FatsViewState();
}

class _FatsViewState extends ConsumerState<FatsView> {
  late List<Ingredient> selectedIngredients;

  @override
  void initState() {
    super.initState();
    selectedIngredients = [...widget.initiallySelected]; // clone list
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
    final allIngredientsAsync = ref.watch(allIngredientsProvider);

    return allIngredientsAsync.when(
      data: (allIngredients) {
        final fats = allIngredients.where((i) => i.macro == 'fat').toList();
        final suggestedIngredients = fats
            .where((i) => !_isSelected(i))
            .toList();

        return CupertinoPageScaffold(
          child: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  const CupertinoSliverNavigationBar(largeTitle: Text('Fats')),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 10,
                      ),
                      child: const Text(
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
                        child: const Text(
                          'Selected',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
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
                  ],
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 10,
                      ),
                      child: const Text(
                        'Suggested',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
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
                    Navigator.pop(context, selectedIngredients);
                  },
                  child: const Text('Next'),
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const Center(child: CupertinoActivityIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }
}
