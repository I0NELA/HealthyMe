import 'package:flutter/cupertino.dart';
import 'package:healthyme_app/main.dart';
import 'package:healthyme_app/models/ingredient.dart';
import 'package:healthyme_app/views/MacroViews/carbs_view.dart';

class HomeScreenView extends StatefulWidget {
  @override
  _HomeScreenViewState createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  List<Ingredient> selectedCarbs = [];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        children: [
          Text("Selected: ${selectedCarbs.length}"),
          Text("Selected: ${selectedCarbs.length}"),
          CupertinoButton(
            child: Text("Go to Carbs"),
            onPressed: () async {
              final updatedIds = await Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (_) => CarbsView(
                    carbs: objectBox.getCarbs(),
                    initiallySelected: selectedCarbs,
                  ),
                ),
              );

              if (updatedIds != null) {
                setState(() {
                  selectedCarbs = updatedIds;
                });
              }
            },
          ),
          Text("Selected: ${selectedCarbs.length}"),
        ],
      ),
    );
  }
}



/* class HomeScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              CupertinoSliverNavigationBar(
                largeTitle: const Text('Build Your Meal'),
              ),
              SliverFillRemaining(
                child: Column(
                  children: [
                    CupertinoButton.filled(
                      onPressed: () {
                        final carbs = objectBox.getCarbs();
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (_) => CarbsView(carbs: carbs),
                          ),
                        );
                      },
                      child: Text("Carbs"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
 */
          //These are the Bottom Icons(WE can remove this code if we use the tab bar)

          /*
            Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: Row(),
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Icon 1
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (_) => HomeScreenView()),
                    );
                  },
                  child: const Icon(
                    CupertinoIcons.home,
                    size: 32,
                    color: CupertinoColors.systemRed,
                  ),
                ),

                // Icon 2
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (_) => CarbsView()),
                    );
                  },
                  child: const Icon(
                    CupertinoIcons.chat_bubble,
                    size: 32,
                    color: CupertinoColors.systemBlue,
                  ),
                ),
              ],*/

