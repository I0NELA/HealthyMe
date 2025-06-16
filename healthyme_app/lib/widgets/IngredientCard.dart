import 'package:flutter/material.dart';
import 'package:healthyme_app/models/ingredient.dart';
class IngredientCard extends StatelessWidget {
  final Ingredient ingredient;
  final bool isAdded;
  final VoidCallback onToggle;

  const IngredientCard({
    Key? key,
    required this.ingredient,
    required this.isAdded,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isAdded ? Colors.green.shade100 : Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(ingredient.imageUrl),
        ),
        title: Text(ingredient.name),
        trailing: IconButton(
          icon: Icon(
            isAdded ? Icons.check_circle : Icons.add_circle_outline,
            color: isAdded ? Colors.green : null,
          ),
          onPressed: onToggle,
        ),
      ),
    );
  }
}


/* 

class IngredientCard extends StatefulWidget {
  final Ingredient ingredient;
  final ValueChanged<Ingredient> onToggle;
  const IngredientCard({Key? key, required this.ingredient, required this.onToggle}) : super(key:key);
  @override
  IngredientCardState createState() => IngredientCardState();
}
  
//State changing When Ingredient Added
class IngredientCardState extends State<IngredientCard>{
    bool isAdded = false;
    void toggleAdd() {
    setState(() {
      isAdded = !isAdded;
    });
    widget.onToggle(widget.ingredient);}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      //use something like this for changing border color...
      // color: isAdded ? Colors.green.shade100 : Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(widget.ingredient.imageUrl),
        ),
        title: Text(widget.ingredient.name),
         trailing: IconButton(
          icon: Icon(
            isAdded ? Icons.check_circle : Icons.add_circle_outline,
            color: isAdded ? Colors.green : null,
            ),
            onPressed: toggleAdd,
        ), 
      )
    );
  }
  
    // TODO: implement createState
    //throw UnimplementedError();

}
 */