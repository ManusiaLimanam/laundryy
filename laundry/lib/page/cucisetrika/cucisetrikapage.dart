import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../class/manageberat.dart';

class CuciSetrikaPage extends StatefulWidget {
  const CuciSetrikaPage({super.key});

  @override
  State<CuciSetrikaPage> createState() => _CuciSetrikaPageState();
}

class _CuciSetrikaPageState extends State<CuciSetrikaPage> {
  BeratManager beratManager = BeratManager();

  void tambahBerat() {
    setState(() {
      beratManager.tambahBerat();
    });
  }

  void kurangiBerat() {
    setState(() {
      beratManager.kurangiBerat();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.edit,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Identitas ",
                      style: GoogleFonts.lato(color: Colors.grey),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    // Nama
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Nama : ",
                          style: GoogleFonts.lato(),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: MediaQuery.of(context).size.height * 0.04,
                          child: TextField(
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),

                    // No. WhatsApp
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "No. WhatsApp : ",
                          style: GoogleFonts.lato(),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: MediaQuery.of(context).size.height * 0.04,
                          child: TextField(
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    // Alamat
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Alamat : ",
                          style: GoogleFonts.lato(),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: MediaQuery.of(context).size.height * 0.04,
                          child: TextField(
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Berat
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Berat : ",
                      style: GoogleFonts.lato(fontSize: 18),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: kurangiBerat,
                          icon: Icon(
                            Icons.remove_circle_sharp,
                            color: Colors.blue,
                            size: 35,
                          ),
                        ),
                        Text("${beratManager.berat.toStringAsFixed(1)} /kg"),
                        IconButton(
                          onPressed: tambahBerat,
                          icon: Icon(
                            Icons.add_circle_sharp,
                            color: Colors.blue,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text(
                      "Rp.",
                      style: GoogleFonts.lato(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
