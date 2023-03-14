import 'package:flutter/material.dart';

import 'main_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Main(),
    );
  }
}

void main() {
  runApp(const MyApp());
}
