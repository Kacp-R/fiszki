import 'package:fiszki/flashcards.dart';
import 'package:fiszki/stats.dart';
import 'package:fiszki/writing_practice.dart';
import 'package:flutter/material.dart';

class Main extends StatefulWidget {
  final int cAnswers;
  final int tAnswers;
  const Main({Key? key, required this.cAnswers, required this.tAnswers}) : super(key: key);

  @override
  State<Main> createState() => _MainState(cAnswers, tAnswers);
}

class _MainState extends State<Main>{
  final int cAnswers;
  final int tAnswers;

  _MainState(this.cAnswers, this.tAnswers);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.amber,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Main Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Flashcards()),
                  );
                },
                child: Text('Flashcards'),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WritingPrac()),
                  );
                },
                child: Text('Prac'),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Stats(cAnswers: cAnswers, tAnswers: tAnswers,)),
                  );
                },
                child: Text('Stats'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
