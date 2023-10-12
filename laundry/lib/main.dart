import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:laundry/page/cucisetrika/tambahancucisetrika.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'page/class/adapter.dart';
import 'page/class/card_model.dart';
import 'page/cucisetrika/cucisetrika.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(CardModelAdapter());
  await Hive.openBox<CardModel>('cards');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: cuciSetrika(),
    );
  }
}
