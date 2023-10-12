import 'package:hive_flutter/adapters.dart';

import 'card_model.dart';

class CardModelAdapter extends TypeAdapter<CardModel> {
  @override
  int get typeId => 0; // Sesuaikan dengan typeId yang Anda gunakan sebelumnya

  @override
  CardModel read(BinaryReader reader) {
    return CardModel(
      reader.readString(),
      reader.readDouble(),
      reader.readInt(),
    );
  }

  @override
  void write(BinaryWriter writer, CardModel obj) {
    writer.writeString(obj.nama);
    writer.writeDouble(obj.harga);
    writer.writeInt(obj.qty);
  }
}
