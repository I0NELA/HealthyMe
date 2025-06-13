import 'package:objectbox/objectbox.dart';

@Entity()
class SelectedIngredient {
  int id = 0;
  int ingredientId;

  SelectedIngredient({required this.ingredientId});
}