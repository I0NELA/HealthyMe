import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:healthyme_app/views/MacroViews/carbs_view.dart';
import 'package:healthyme_app/views/recipe_detail_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  List<Ingredient> selectedCarbs = [];
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        // activeColor: Color.fromARGB(255, 145, 199, 136),
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
        // You can switch content based on the tab index if you want
        return CupertinoTabView(
          builder: (context) {
            return CustomScrollView(
              slivers: [
                const CupertinoSliverNavigationBar(
                  largeTitle: Text(
                    'Build Your Meal 🥗',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  // backgroundColor: Color.fromARGB(255, 145, 199, 136),
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
                                  touchCallback: (event, response) {
                                    if (response != null &&
                                        response.touchedSection != null &&
                                        response
                                                .touchedSection!
                                                .touchedSectionIndex ==
                                            1 &&
                                        event is FlTapUpEvent) {
                                      Navigator.of(context).push(
                                        CupertinoPageRoute(
                                          builder: (context) => CarbsView(),
                                        ),
                                      );
                                    }
                                  },
                                ),
                                sections: [
                                  PieChartSectionData(
                                    value: 40,
                                    color: Colors.white,
                                    title: 'Proteins',
                                    radius: 100,
                                    titleStyle: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.green.shade300.withOpacity(
                                        0.7,
                                      ),
                                      width: 5,
                                      strokeAlign:
                                          BorderSide.strokeAlignOutside,
                                    ),
                                  ),
                                  PieChartSectionData(
                                    value: 35,
                                    color: Colors.white,
                                    title: 'Carbs',
                                    radius: 100,
                                    titleStyle: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.green.shade300.withOpacity(
                                        0.7,
                                      ),
                                      width: 5,
                                      strokeAlign:
                                          BorderSide.strokeAlignOutside,
                                    ),
                                  ),
                                  PieChartSectionData(
                                    value: 25,
                                    color: Colors.white,
                                    title: 'Fats',
                                    radius: 100,
                                    titleStyle: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.green.shade300.withOpacity(
                                        0.7,
                                      ),
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
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Recipe History',
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
                                  builder: (context) =>
                                      const RecipeDetailView(),
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
                                  // Use a Material icon or Unicode arrow for best compatibility
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
      },
    );
  }
}
