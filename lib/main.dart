import 'package:flutter/material.dart';

import 'main_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nauka języka',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primarySwatch: Colors.lime,
        appBarTheme: AppBarTheme(
          color: Colors.black,
          foregroundColor: Colors.lime,
        )
      ),
      home: Main(cAnswers: 0, tAnswers: 0,),
    );
  }
}

void main() {
  runApp(const MyApp());
}
