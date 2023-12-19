// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, unused_import, unused_element, unnecessary_import

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shoeproject_hive/DB/Database.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<ShoeCard>> shoeListNotifier = ValueNotifier([]);

Future<void> openHiveBoxes() async {
  try {
    await Hive.initFlutter();
    Hive.registerAdapter(ShoeCardAdapter());

    await Hive.openBox<ShoeCard>('ShoeCard_db');
    await getAllShoeCard();
  } catch (e) {
    print("Error initializing Hive: $e");
  }
}

Future<void> addCard(ShoeCard value) async {
  final shoeCardDB = await Hive.openBox<ShoeCard>('ShoeCard_db');
  try {
    final _id = await shoeCardDB.add(value);
    value.id = _id;
    List<ShoeCard> updatedList = List.from(shoeListNotifier.value)..add(value);
    shoeListNotifier.value = updatedList;
    shoeListNotifier.notifyListeners();
  } catch (e, stackTrace) {
    print("Error adding card: $e");
    print(stackTrace);
  }
}

Future<void> getAllShoeCard() async {
  final shoeCardDB = await Hive.openBox<ShoeCard>('ShoeCard_db');
  try {
    shoeListNotifier.value = List.from(shoeCardDB.values);
    shoeListNotifier.notifyListeners();
  } catch (e) {
    print("Error getting all cards: $e");
  }
}

Future<void> deleteShoeCard(int id) async {
  final shoeCardDB = await Hive.openBox<ShoeCard>('ShoeCard_db');
  try {
    await shoeCardDB.delete(id);
  } catch (e) {
    print("Error deleting card: $e");
  }
}

Future<void> closeShoeCard() async {
  await Hive.close();
}
