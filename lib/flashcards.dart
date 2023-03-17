//bartek

import 'dart:math';
import 'package:fiszki/flashcards_list.dart';
import 'package:fiszki/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';


class FlashcardsPage extends StatefulWidget {
  const FlashcardsPage({super.key});

  @override
  FlashcardsPageState createState() => FlashcardsPageState();
}

class FlashcardsPageState extends State<FlashcardsPage> {

  int index = 0;
  List <int> prevIndex = [];

//geez zdecydowanie za dlugo zajelo robienie zeby te funkcje dzialaly
  void nextFlashcard() {
    setState(() {
      prevIndex.add(index);
      index = Random().nextInt(flashcards.length);
    });
  }


  void prevFlashcard() {
    setState(() {
      if (prevIndex.isNotEmpty) {
        index = prevIndex.removeLast();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fiszki',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.black54,
          primarySwatch: Colors.lime,
          appBarTheme: const AppBarTheme(
            color: Colors.black54,
            foregroundColor: Colors.lime,
          )),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Main(cAnswers: 0, tAnswers: 0)),
              );
            },
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlipCard(
              direction: FlipDirection.HORIZONTAL,
              front: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: 500,
                  width: 330,
                  color: Colors.white10,
                  child: Center(
                    child: Text(
                      flashcards[index].pageone,
                      style: const TextStyle(fontSize: 36, color: Colors.white),
                    ),
                  ),
                ),
              ),
              back: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: 500,
                  width: 330,
                  color: Colors.lime,
                  child: Center(
                    child: Text(
                      flashcards[index].pagetwo,
                      style: const TextStyle(fontSize: 36, color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 145,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.lime,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios, size: 30),
                    color: Colors.black,
                    onPressed: prevFlashcard,
                  ),
                ),
                Container(
                  width: 145,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.lime,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 30,
                    ),
                    color: Colors.black,
                    onPressed: nextFlashcard,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}