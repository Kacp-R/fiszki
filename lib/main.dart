import 'package:flutter/material.dart';

import 'main_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LIME - master your language skills!',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          primarySwatch: Colors.lime,
          appBarTheme: const AppBarTheme(
            color: Colors.black,
            foregroundColor: Colors.lime,
          )),
      home: const Main(
        cAnswers: 0,
        tAnswers: 0,
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}
