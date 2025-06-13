import 'package:objectbox/objectbox.dart';

@Entity()
class Ingredient {
  int id; // ObjectBox need ID
  String name;
  String imageUrl;

  Ingredient({this.id = 0, required this.name,required this.imageUrl,});
}