// ignore_for_file: non_constant_identifier_names, duplicate_import

import 'package:hive/hive.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'Database.g.dart';

@HiveType(typeId: 0)
class ShoeCard extends HiveObject {
  @HiveField(1)
  int id = 0;
  @HiveField(2)
  late String? shoe_name;
  @HiveField(3)
  late String? description;
  @HiveField(4)
  late String? Price;
  @HiveField(5)
  late String? discount;
  @HiveField(6)
  late String? final_price;
  @HiveField(7)
  late String? image_url;

  ShoeCard({
    required this.shoe_name,
    required this.description,
    required this.Price,
    required this.discount,
    required this.final_price,
    required this.image_url,
  });
}
