import 'package:flutter/material.dart';
import 'package:laundry/page/cucisetrika/cucisetrika.dart';
import 'package:laundry/page/cucisetrika/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
          // test(),
          cuciSetrika(),
    );
  }
}
