import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:objectbox/objectbox.dart';
import '../models/ingredient.dart';
import '../providers/getcsv_data.dart';
import '../objectbox.g.dart'; // Make sure you generate this

late final Store store;

final storeProvider = Provider<Store>((ref) {
  return store;
});

final allIngredientsProvider = FutureProvider<List<Ingredient>>((ref) async {
  final store = ref.read(storeProvider);
  await loadCsvToObjectBox(store);
  return store.box<Ingredient>().getAll();
});

final carbsProvider = Provider<List<Ingredient>>((ref) {
  final all = ref
      .watch(allIngredientsProvider)
      .maybeWhen<List<Ingredient>>(data: (data) => data, orElse: () => []);
  return all.where((i) => i.macro == 'carb').toList();
});

final proteinsProvider = Provider<List<Ingredient>>((ref) {
  final all = ref
      .watch(allIngredientsProvider)
      .maybeWhen<List<Ingredient>>(data: (data) => data, orElse: () => []);
  return all.where((i) => i.macro == 'protein').toList();
});

final fatsProvider = Provider<List<Ingredient>>((ref) {
  final all = ref
      .watch(allIngredientsProvider)
      .maybeWhen<List<Ingredient>>(data: (data) => data, orElse: () => []);
  print("fats in the fatsprovider ");
  print(all.where((i) => i.macro == 'fat'));
  return all.where((i) => i.macro == 'fat').toList();
});
