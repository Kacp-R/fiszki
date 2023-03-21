//bartek

import 'dart:math';
import 'package:fiszki/flashcards_list.dart';
import 'package:fiszki/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class FlashcardsPage extends StatefulWidget {
  final int cAnswers;
  final int tAnswers;

  const FlashcardsPage(
      {super.key, required this.cAnswers, required this.tAnswers});

  @override
  FlashcardsPageState createState() => FlashcardsPageState(cAnswers, tAnswers);
}

class FlashcardsPageState extends State<FlashcardsPage> {
  final int cAnswers;
  final int tAnswers;

  int index = 0;
  List<int> prevIndex = [];

  FlashcardsPageState(this.cAnswers, this.tAnswers);

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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Main(cAnswers: cAnswers, tAnswers: tAnswers)),
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
                height: 475,
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
                height: 475,
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
          const SizedBox(height: 25),
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
    );
  }
}
