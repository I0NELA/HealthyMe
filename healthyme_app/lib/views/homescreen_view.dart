import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:healthyme_app/main.dart';
import 'package:healthyme_app/models/ingredient.dart';
import 'package:healthyme_app/views/MacroViews/carbs_view.dart';
import 'package:healthyme_app/views/MacroViews/proteins_view.dart';
import 'package:healthyme_app/views/MacroViews/fats_view.dart';
import 'package:healthyme_app/views/chat_view.dart';
import 'package:healthyme_app/views/recipe_detail_view.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Ingredient> selectedCarbs = [];
  List<Ingredient> selectedProteins = [];
  List<Ingredient> selectedFats = [];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home, size: 25),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble, size: 25),
            label: 'Chat',
          ),
        ],
      ),

      tabBuilder: (context, index) {
        if (index == 0) {
          return CupertinoTabView(
            builder: (context) {
              return CustomScrollView(
                slivers: [
                  const CupertinoSliverNavigationBar(
                    largeTitle: Text(
                      'Build Your Meal 🥗',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SafeArea(
                      child: Column(
                        children: [
                          const SizedBox(height: 24),
                          Center(
                            child: SizedBox(
                              width: 340,
                              height: 340,
                              child: PieChart(
                                PieChartData(
                                  pieTouchData: PieTouchData(
                                    touchCallback: (event, response) async {
                                      if (response != null &&
                                          response.touchedSection != null &&
                                          event is FlTapUpEvent) {
                                        final index = response
                                            .touchedSection!
                                            .touchedSectionIndex;
                                        if (index == 0) {
                                          // Proteins tapped
                                          final result =
                                              await showCupertinoModalBottomSheet(
                                                expand: true,
                                                context: Navigator.of(
                                                  context,
                                                  rootNavigator: true,
                                                ).context,
                                                builder: (context) => Container(
                                                  height: 400,
                                                  color: CupertinoColors
                                                      .systemBackground,
                                                  child: ProteinsView(
                                                    proteins: objectBox
                                                        .getProts(),
                                                    initiallySelected:
                                                        selectedProteins,
                                                    previousPageTitle: 'Home',
                                                  ),
                                                  
                                                ),
                                              );
                                              
                                          if (result != null &&
                                              result is List<Ingredient>) {
                                            setState(() {
                                              selectedProteins = result;
                                            });
                                          }
                                        } else if (index == 1) {
                                          // Carbs tapped
                                          final result = await showCupertinoModalBottomSheet(
                                                expand: true,
                                                context: Navigator.of(
                                                  context,
                                                  rootNavigator: true,
                                                ).context,
                                                builder: (context) => Container(
                                                  height: 400,
                                                  color: CupertinoColors
                                                      .systemBackground,
                                                  child: CarbsView(
                                                    carbs: objectBox
                                                        .getCarbs(),
                                                    initiallySelected:
                                                        selectedCarbs,
                                                    previousPageTitle: 'Home',
                                                  ),
                                                ),
                                              );
                                              
                                          if (result != null &&
                                              result is List<Ingredient>) {
                                            setState(() {
                                              selectedCarbs = result;
                                            });
                                          }
                                        } else if (index == 2) {
                                          // Fats tapped
                                          final result =
                                              await showCupertinoModalBottomSheet(
                                                expand: true,
                                                context: Navigator.of(
                                                  context,
                                                  rootNavigator: true,
                                                ).context,
                                                builder: (context) => Container(
                                                  height: 400,
                                                  color: CupertinoColors
                                                      .systemBackground,
                                                  child: FatsView(
                                                    fats: objectBox
                                                        .getFats(),
                                                    initiallySelected:
                                                        selectedFats,
                                                    previousPageTitle: 'Home',
                                                  ),
                                                  
                                                ),
                                              );
                                          if (result != null &&
                                              result is List<Ingredient>) {
                                            setState(() {
                                              selectedFats = result;
                                            });
                                          }
                                        }
                                      }
                                    },
                                  ),
                                  sections: [
                                    PieChartSectionData(
                                      value: 40,
                                      color: selectedProteins.isNotEmpty
                                          ? Colors.green
                                          : Colors.white,
                                      title: 'Proteins',
                                      radius: 100,
                                      titleStyle: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      borderSide: BorderSide(
                                        color: Colors.green.shade300
                                            .withOpacity(0.7),
                                        width: 5,
                                        strokeAlign:
                                            BorderSide.strokeAlignOutside,
                                      ),
                                    ),
                                    PieChartSectionData(
                                      value: 35,
                                      color: selectedCarbs.isNotEmpty
                                          ? Colors.green
                                          : Colors.white,
                                      title: 'Carbs',
                                      radius: 100,
                                      titleStyle: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      borderSide: BorderSide(
                                        color: Colors.green.shade300
                                            .withOpacity(0.7),
                                        width: 5,
                                        strokeAlign:
                                            BorderSide.strokeAlignOutside,
                                      ),
                                    ),
                                    PieChartSectionData(
                                      value: 25,
                                      color: selectedFats.isNotEmpty
                                          ? Colors.green
                                          : Colors.white,
                                      title: 'Fats',
                                      radius: 100,
                                      titleStyle: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      borderSide: BorderSide(
                                        color: Colors.green.shade300
                                            .withOpacity(0.7),
                                        width: 5,
                                        strokeAlign:
                                            BorderSide.strokeAlignOutside,
                                      ),
                                    ),
                                  ],
                                  sectionsSpace: 8,
                                  centerSpaceRadius: 55,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Recipes',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green.shade900,
                                ),
                              ),
                            ),
                          ),
                          // Recipe history card example
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                              vertical: 8.0,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  CupertinoPageRoute(
                                    builder: (context) => RecipeDetailView(),
                                    title: 'Home',
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                  horizontal: 12,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Avocado Toast', // Example recipe title
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // You can add more recipe cards here
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        } else if (index == 1) {
          return ChatView();
        } else {
          return Container();
        }
      },
    );
  }
}
