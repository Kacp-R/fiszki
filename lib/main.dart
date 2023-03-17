import 'package:flutter/material.dart';

import 'main_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Main(cAnswers: 0, tAnswers: 0,),
    );
  }
}

void main() {
  runApp(const MyApp());
}
