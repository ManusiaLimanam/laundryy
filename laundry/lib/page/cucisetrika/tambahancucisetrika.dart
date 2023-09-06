import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class tambahanCS extends StatefulWidget {
  const tambahanCS({super.key});

  @override
  State<tambahanCS> createState() => _tambahanCSState();
}

class _tambahanCSState extends State<tambahanCS> {
  List<Map<String, dynamic>> cards =
      []; // Menggunakan Map untuk menyimpan data item
  final TextEditingController namaController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();

  Future<void> tambahCard() async {
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
                double harga = double.tryParse(hargaController.text) ?? 0.0;
                if (namaItem.isNotEmpty) {
                  setState(() {
                    cards.add({
                      'nama': namaItem,
                      'harga': harga,
                      'qty': 0, // Menambahkan qty awal
                    });
                  });
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
  }

  void hapusCard(int index) {
    setState(() {
      cards.removeAt(index);
    });
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
              "Rp.${harga.toStringAsFixed(2)}", // Menampilkan biaya per item dengan format 2 digit desimal
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
                      // Kurangi jumlah qty
                      if (qty > 0) {
                        cards[index]['qty'] = qty - 1;
                      }
                    });
                  },
                ),
                Text(qty.toString()), // Menampilkan jumlah qty
                IconButton(
                  icon: Icon(Icons.add_circle, color: Colors.blue),
                  onPressed: () {
                    setState(() {
                      // Tambah jumlah qty
                      cards[index]['qty'] = qty + 1;
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
        onPressed: () {
          tambahCard();
        },
        child: Icon(Icons.add),
        hoverElevation: 50,
      ),
      body: ListView.builder(
        itemCount: cards.length,
        itemBuilder: (BuildContext context, int index) {
          final card = cards[index];
          return buildCard(
            card['nama'],
            card['harga'],
            card['qty'],
            index,
          );
        },
      ),
    );
  }
}
