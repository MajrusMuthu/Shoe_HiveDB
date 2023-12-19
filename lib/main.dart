import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shoeproject_hive/DB/Database.dart';
import 'package:shoeproject_hive/MaiPage.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ShoeCardAdapter());
  await Hive.openBox<ShoeCard>('shoeCard_db');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}
