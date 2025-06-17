import 'package:flutter/cupertino.dart';

class RecipeDetailView extends StatelessWidget {
  const RecipeDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Avocado Toast'),
        // Do NOT override leading or middle with GestureDetector!
      ),
      child: Center(child: Text('Recipe details here!')),
    );
  }
}
