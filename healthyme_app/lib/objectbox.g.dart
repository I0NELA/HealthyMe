// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again
// with `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'models/ingredient.dart';
import 'models/selectedingredient.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
    id: const obx_int.IdUid(1, 6345961802193856186),
    name: 'SelectedIngredient',
    lastPropertyId: const obx_int.IdUid(2, 3365681510393666630),
    flags: 0,
    properties: <obx_int.ModelProperty>[
      obx_int.ModelProperty(
        id: const obx_int.IdUid(1, 584878583500717797),
        name: 'id',
        type: 6,
        flags: 1,
      ),
      obx_int.ModelProperty(
        id: const obx_int.IdUid(2, 3365681510393666630),
        name: 'ingredientId',
        type: 6,
        flags: 0,
      ),
    ],
    relations: <obx_int.ModelRelation>[],
    backlinks: <obx_int.ModelBacklink>[],
  ),
  obx_int.ModelEntity(
    id: const obx_int.IdUid(2, 4176517391390478111),
    name: 'Ingredient',
    lastPropertyId: const obx_int.IdUid(4, 3240625911498871733),
    flags: 0,
    properties: <obx_int.ModelProperty>[
      obx_int.ModelProperty(
        id: const obx_int.IdUid(1, 8898432284884090706),
        name: 'id',
        type: 6,
        flags: 1,
      ),
      obx_int.ModelProperty(
        id: const obx_int.IdUid(2, 3741473494135882369),
        name: 'name',
        type: 9,
        flags: 0,
      ),
      obx_int.ModelProperty(
        id: const obx_int.IdUid(4, 3240625911498871733),
        name: 'macro',
        type: 9,
        flags: 0,
      ),
    ],
    relations: <obx_int.ModelRelation>[],
    backlinks: <obx_int.ModelBacklink>[],
  ),
];

/// Shortcut for [obx.Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [obx.Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
Future<obx.Store> openStore({
  String? directory,
  int? maxDBSizeInKB,
  int? maxDataSizeInKB,
  int? fileMode,
  int? maxReaders,
  bool queriesCaseSensitiveDefault = true,
  String? macosApplicationGroup,
}) async {
  await loadObjectBoxLibraryAndroidCompat();
  return obx.Store(
    getObjectBoxModel(),
    directory: directory ?? (await defaultStoreDirectory()).path,
    maxDBSizeInKB: maxDBSizeInKB,
    maxDataSizeInKB: maxDataSizeInKB,
    fileMode: fileMode,
    maxReaders: maxReaders,
    queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
    macosApplicationGroup: macosApplicationGroup,
  );
}

/// Returns the ObjectBox model definition for this project for use with
/// [obx.Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
    entities: _entities,
    lastEntityId: const obx_int.IdUid(2, 4176517391390478111),
    lastIndexId: const obx_int.IdUid(0, 0),
    lastRelationId: const obx_int.IdUid(0, 0),
    lastSequenceId: const obx_int.IdUid(0, 0),
    retiredEntityUids: const [],
    retiredIndexUids: const [],
    retiredPropertyUids: const [6509722974170491555],
    retiredRelationUids: const [],
    modelVersion: 5,
    modelVersionParserMinimum: 5,
    version: 1,
  );

  final bindings = <Type, obx_int.EntityDefinition>{
    SelectedIngredient: obx_int.EntityDefinition<SelectedIngredient>(
      model: _entities[0],
      toOneRelations: (SelectedIngredient object) => [],
      toManyRelations: (SelectedIngredient object) => {},
      getId: (SelectedIngredient object) => object.id,
      setId: (SelectedIngredient object, int id) {
        object.id = id;
      },
      objectToFB: (SelectedIngredient object, fb.Builder fbb) {
        fbb.startTable(3);
        fbb.addInt64(0, object.id);
        fbb.addInt64(1, object.ingredientId);
        fbb.finish(fbb.endTable());
        return object.id;
      },
      objectFromFB: (obx.Store store, ByteData fbData) {
        final buffer = fb.BufferContext(fbData);
        final rootOffset = buffer.derefObject(0);
        final ingredientIdParam = const fb.Int64Reader().vTableGet(
          buffer,
          rootOffset,
          6,
          0,
        );
        final object = SelectedIngredient(ingredientId: ingredientIdParam)
          ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

        return object;
      },
    ),
    Ingredient: obx_int.EntityDefinition<Ingredient>(
      model: _entities[1],
      toOneRelations: (Ingredient object) => [],
      toManyRelations: (Ingredient object) => {},
      getId: (Ingredient object) => object.id,
      setId: (Ingredient object, int id) {
        object.id = id;
      },
      objectToFB: (Ingredient object, fb.Builder fbb) {
        final nameOffset = fbb.writeString(object.name);
        final macroOffset = fbb.writeString(object.macro);
        fbb.startTable(5);
        fbb.addInt64(0, object.id);
        fbb.addOffset(1, nameOffset);
        fbb.addOffset(3, macroOffset);
        fbb.finish(fbb.endTable());
        return object.id;
      },
      objectFromFB: (obx.Store store, ByteData fbData) {
        final buffer = fb.BufferContext(fbData);
        final rootOffset = buffer.derefObject(0);
        final idParam = const fb.Int64Reader().vTableGet(
          buffer,
          rootOffset,
          4,
          0,
        );
        final nameParam = const fb.StringReader(
          asciiOptimization: true,
        ).vTableGet(buffer, rootOffset, 6, '');
        final macroParam = const fb.StringReader(
          asciiOptimization: true,
        ).vTableGet(buffer, rootOffset, 10, '');
        final object = Ingredient(
          id: idParam,
          name: nameParam,
          macro: macroParam,
        );

        return object;
      },
    ),
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [SelectedIngredient] entity fields to define ObjectBox queries.
class SelectedIngredient_ {
  /// See [SelectedIngredient.id].
  static final id = obx.QueryIntegerProperty<SelectedIngredient>(
    _entities[0].properties[0],
  );

  /// See [SelectedIngredient.ingredientId].
  static final ingredientId = obx.QueryIntegerProperty<SelectedIngredient>(
    _entities[0].properties[1],
  );
}

/// [Ingredient] entity fields to define ObjectBox queries.
class Ingredient_ {
  /// See [Ingredient.id].
  static final id = obx.QueryIntegerProperty<Ingredient>(
    _entities[1].properties[0],
  );

  /// See [Ingredient.name].
  static final name = obx.QueryStringProperty<Ingredient>(
    _entities[1].properties[1],
  );

  /// See [Ingredient.macro].
  static final macro = obx.QueryStringProperty<Ingredient>(
    _entities[1].properties[2],
  );
}
