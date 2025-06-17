import 'package:objectbox/objectbox.dart';

@Entity()
class Ingredient {
  int id; // ObjectBox need ID
  String name;
  String macro;
  //String imageUrl;

  Ingredient({
    this.id = 0,
    required this.name,
    required this.macro,
    //required this.imageUrl,
  });

  @override
  String toString() {
    return 'Ingredient{name: $name, macro: $macro}';
    // imageUrl: $imageUrl
  }
}
