import 'package:flutter/material.dart';
import 'package:laundry/page/cucisetrika/cucisetrikapage.dart';
import 'package:laundry/page/cucisetrika/tambahancucisetrika.dart';

class cuciSetrika extends StatefulWidget {
  @override
  _cuciSetrikaState createState() => _cuciSetrikaState();
}

class _cuciSetrikaState extends State<cuciSetrika>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cuci Setrika'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Cuci Setrika'),
            Tab(text: 'Tambahan'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // cuci setrika
          CuciSetrikaPage(),

          // Konten untuk Tab 2
          tambahanCS()
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: () {},
            child: Text("cetak Struk"),
          ),
        ),
      ),
    );
  }
}
