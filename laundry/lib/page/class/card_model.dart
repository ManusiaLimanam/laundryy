import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class CardModel extends HiveObject {
  @HiveField(0)
  String nama;

  @HiveField(1)
  double harga;

  @HiveField(2)
  int qty;

  CardModel(this.nama, this.harga, this.qty);
}
