import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(const HealthyMeApp());
}

class HealthyMeApp extends StatelessWidget {
  const HealthyMeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HealthyMe',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color(0xFFEAF3E1),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('🍽️ ', style: TextStyle(fontSize: 26)),
            Text(
              'BUILD YOUR MEAL',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 4,
                    color: Colors.green.shade700,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.green.shade700,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          Center(
            child: SizedBox(
              width: 340,
              height: 340,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      value: 40,
                      color: Colors.grey.withOpacity(0.2),
                      title: 'Proteins',
                      radius: 100,
                      titleStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      borderSide: BorderSide(
                        color: Colors.green.shade300.withOpacity(0.7),
                        width: 5,
                        strokeAlign: BorderSide.strokeAlignOutside,
                      ),
                    ),
                    PieChartSectionData(
                      value: 35,
                      color: Colors.grey.withOpacity(0.2),
                      title: 'Carbs',
                      radius: 100,
                      titleStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      borderSide: BorderSide(
                        color: Colors.green.shade300.withOpacity(0.7),
                        width: 5,
                        strokeAlign: BorderSide.strokeAlignOutside,
                      ),
                    ),
                    PieChartSectionData(
                      value: 25,
                      color: Colors.grey.withOpacity(0.2),
                      title: 'Fats',
                      radius: 100,
                      titleStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      borderSide: BorderSide(
                        color: Colors.green.shade300.withOpacity(0.7),
                        width: 5,
                        strokeAlign: BorderSide.strokeAlignOutside,
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
          // Placeholder for recipe history section
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
          // You can add your recipe history list here
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: 'Chat'),
        ],
        currentIndex: 0,
        onTap: (index) {
          // TODO: Add navigation logic for bottom bar
          print("Bottom nav tapped: $index");
        },
      ),
    );
  }

  /// Helper to create a macro button (not used with pie chart, but kept for future use)
  Widget buildMacroButton(String title, Color color) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        color: color.withOpacity(0.8),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
