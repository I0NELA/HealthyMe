import 'package:flutter/cupertino.dart';
import 'package:healthyme_app/views/homescreen_view.dart';
import 'package:healthyme_app/widgets/ingredient_card.dart';

class CarbsView extends StatelessWidget {
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
                    Column(children: [IngredientCard(), IngredientCard()]),
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
                    Column(children: [IngredientCard(), IngredientCard()]),
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
                    CupertinoPageRoute(builder: (_) => HomeScreenView()),
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
