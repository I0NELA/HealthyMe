import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthyme_app/models/ingredient.dart';
import 'package:healthyme_app/views/homescreen_view.dart';
import 'package:healthyme_app/widgets/ingredient_card.dart';

class CarbsView extends StatefulWidget {
  final List<Ingredient> carbs;
  //final Set<int> selectedIds;
  final List<Ingredient> initiallySelected;

  const CarbsView({
    required this.carbs,
    //required this.selectedIds,
    required this.initiallySelected,
  });

  @override
  State<CarbsView> createState() => _CarbsViewState();
}

class _CarbsViewState extends State<CarbsView> {
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
    final suggestedIngredients = widget.carbs
        .where((i) => !_isSelected(i))
        .toList();

    return CupertinoPageScaffold(
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              const CupertinoSliverNavigationBar(largeTitle: Text('Carbs')),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10,
                  ),
                  child: Text(
                    "Carbohydrates, or carbs, are the main source of energy for your body's cells, tissues, and organs.",
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




/* import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthyme_app/models/ingredient.dart';
import 'package:healthyme_app/views/homescreen_view.dart';
import 'package:healthyme_app/widgets/ingredient_card.dart';



class CarbsView extends StatelessWidget {
  final List<Ingredient> carbs;
  const CarbsView({Key? key, required this.carbs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              const CupertinoSliverNavigationBar(largeTitle: Text('Carbs')),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10,
                  ),
                  child: Text(
                    "Carbohydrates, or carbs, are the main source of energy for your body's cells, tissues, and organs.",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),

              /// Section: Selected
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10,
                  ),
                  child: Text(
                    'Selected',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              /* SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final ingredient = carbs[index];
                  return IngredientCard(ingredient: ingredient);
                }, childCount: carbs.length),
              ), */

              /// Section: Suggested (placeholder for now)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Suggested',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // You can add suggested ingredients list here later
                    ],
                  ),
                ),
              ),
              // spacing above button
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final ingredient = carbs[index];
                  return IngredientCard(ingredient: ingredient);
                }, childCount: carbs.length),
              ),
            ],
          ),

          /// Fixed "Next" Button
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: CupertinoButton.filled(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (_) => HomeScreenView()),
                  );
                },
                child: const Text('Next'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
 */



/* import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:healthyme_app/models/ingredient.dart';
import 'package:healthyme_app/views/homescreen_view.dart';
import 'package:healthyme_app/widgets/ingredient_card.dart';


class CarbsView extends StatelessWidget {
  final List<Ingredient> carbs;
  const CarbsView({Key? key, required this.carbs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              CupertinoSliverNavigationBar(largeTitle: const Text('Carbs')),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: const Text(
                      "Carbohydrates, or carbs are the main source of energy for your body's cells, tissues, and organs.",
                      style: TextStyle(fontSize: 18),
                    ),




                  ),
                ),
              ),
              SliverFillRemaining(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //This is the Selected Ingredients section
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: const Text(
                        'Selected',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Column(
                      children: [
                        //Expanded(
                        // child:
                        ListView.builder(
                          
                          itemCount: carbs.length,
                          itemBuilder: (context, index) {
                            final ingredient = carbs[index];
                            //final isAdded = selectedIds.contains(ingredient.id);
                            return IngredientCard(
                              ingredient: ingredient,
                              // isAdded: isAdded,
                              //onToggle: () => toggleIngredient(ingredient),
                            );
                          },
                        ),
                        // ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    //This is the UnSelected Ingredients section
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: const Text(
                        'Suggested',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Column(children: [IngredientCard(), IngredientCard()]),
                  ],
                ),
              ),
            ],
          ),

          //This is the NEXT Button That is Fixed in scrolling
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: CupertinoButton.filled(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (_) => HomeScreen()),
                  );
                },
                color: CupertinoColors.activeBlue, // Optional background color
                child: const Text('Next'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
 */
