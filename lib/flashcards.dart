import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class Flashcards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fiszki',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FlashcardsPage(),
    );
  }
}

class FlashcardsPage extends StatefulWidget {
  @override
  _FlashcardsPageState createState() => _FlashcardsPageState();
}

class _FlashcardsPageState extends State<FlashcardsPage> {
  List<Flashcard> flashcards = [    Flashcard('Apple', 'Jabłko'),    Flashcard('Grape', 'Wino w wodzie'),    Flashcard('Pear', 'Gruszka'),  ];

  int index = 0;

  void _nextFlashcard() {
    setState(() {
      index++;
      if (index >= flashcards.length) {
        index = 0;
      }
    });
  }

  void _prevFlashcard() {
    setState(() {
      index--;
      if (index < 0) {
        index = flashcards.length - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fiszki'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlipCard(
            direction: FlipDirection.HORIZONTAL, // kierunek, w którym ma być przesunięcie
            front: Container(
              height: 200,
              width: 300,
              color: Colors.blue,
              child: Center(
                child: Text(
                  flashcards[index].pageone,
                  style: TextStyle(fontSize: 36, color: Colors.white),
                ),
              ),
            ),
            back: Container(
              height: 200,
              width: 300,
              color: Colors.green,
              child: Center(
                child: Text(
                  flashcards[index].pagetwo,
                  style: TextStyle(fontSize: 36, color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _prevFlashcard,
                child: Text('Poprzednia'),
              ),
              ElevatedButton(
                onPressed: _nextFlashcard,
                child: Text('Następna'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Flashcard {
  String pageone;
  String pagetwo;

  Flashcard(this.pageone, this.pagetwo);
}
