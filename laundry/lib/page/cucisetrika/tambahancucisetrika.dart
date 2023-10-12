import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive/hive.dart';

import '../class/card_model.dart';

class tambahanCS extends StatefulWidget {
  const tambahanCS({Key? key});

  @override
  State<tambahanCS> createState() => _tambahanCSState();
}

class _tambahanCSState extends State<tambahanCS> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();

  Future<void> tambahCard(String namaItem, double harga) async {
    final cardsBox = await Hive.openBox<CardModel>('cards');
    final card = CardModel(namaItem, harga, 0);
    await cardsBox.add(card);
  }

  void hapusCard(int index) {
    final cardsBox = Hive.box<CardModel>('cards');
    cardsBox.deleteAt(index);
  }

  Widget buildCard(String nama, double harga, int qty, int index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  nama,
                  style: GoogleFonts.lato(fontSize: 18),
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    hapusCard(index);
                  },
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              "Rp.${harga.toStringAsFixed(2)}",
              style: GoogleFonts.lato(fontSize: 18),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.remove_circle, color: Colors.blue),
                  onPressed: () {
                    setState(() {
                      if (qty > 0) {
                        qty -= 1;
                        final cardsBox = Hive.box<CardModel>('cards');
                        final card = CardModel(nama, harga, qty);
                        cardsBox.putAt(index, card);
                      }
                    });
                  },
                ),
                Text(qty.toString()),
                IconButton(
                  icon: Icon(Icons.add_circle, color: Colors.blue),
                  onPressed: () {
                    setState(() {
                      qty += 1;
                      final cardsBox = Hive.box<CardModel>('cards');
                      final card = CardModel(nama, harga, qty);
                      cardsBox.putAt(index, card);
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Tambah Item'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: namaController,
                      decoration: InputDecoration(labelText: 'Nama Item'),
                    ),
                    TextField(
                      controller: hargaController,
                      decoration: InputDecoration(labelText: 'Harga'),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      String namaItem = namaController.text;
                      double harga =
                          double.tryParse(hargaController.text) ?? 0.0;
                      if (namaItem.isNotEmpty) {
                        tambahCard(namaItem, harga);
                        namaController.clear();
                        hargaController.clear();
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('Tambah'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
        hoverElevation: 50,
      ),
      body: WatchBoxBuilder(
        box: Hive.box<CardModel>('cards'),
        builder: (context, box) {
          final cards = box.values.toList().cast<CardModel>();
          return ListView.builder(
            itemCount: cards.length,
            itemBuilder: (BuildContext context, int index) {
              final card = cards[index];
              return buildCard(
                card.nama,
                card.harga,
                card.qty,
                index,
              );
            },
          );
        },
      ),
    );
  }
}
