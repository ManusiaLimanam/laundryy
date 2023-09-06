import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../class/qtymanager.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  List<Widget> cards = [];
  final QtyManager qtyManager =
      QtyManager(); // Create an instance of QtyManager

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  "Rp.", // Menampilkan biaya per item dengan format 2 digit desimal
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
                          qtyManager.kurangiQty();
                        });
                      },
                    ),
                    Text(qtyManager.qty.toString()), // Menampilkan jumlah qty
                    IconButton(
                      icon: Icon(Icons.add_circle, color: Colors.blue),
                      onPressed: () {
                        setState(() {
                          // Tambah jumlah qty
                          qtyManager.tambahQty();
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
