import 'package:fiszki/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class Flashcards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fiszki',
      theme: ThemeData(
        primarySwatch: Colors.lime,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          color: Colors.black,
          foregroundColor: Colors.yellow,
        )
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
  List<Flashcard> flashcards = [
    Flashcard('Animal', 'Zwierzę'),
    Flashcard('Art', 'Sztuka'),
    Flashcard('Baby', 'Dziecko'),
    Flashcard('Backpack', 'Plecak'),
    Flashcard('Ball', 'Piłka'),
    Flashcard('Bathroom', 'Łazienka'),
    Flashcard('Bed', 'Łóżko'),
    Flashcard('Bicycle', 'Rower'),
    Flashcard('Bird', 'Ptak'),
    Flashcard('Book', 'Książka'),
    Flashcard('Bottle', 'Butelka'),
    Flashcard('Box', 'Pudełko'),
    Flashcard('Boy', 'Chłopiec'),
    Flashcard('Bread', 'Chleb'),
    Flashcard('Breakfast', 'Śniadanie'),
    Flashcard('Building', 'Budynek'),
    Flashcard('Bus', 'Autobus'),
    Flashcard('Business', 'Biznes'),
    Flashcard('Butterfly', 'Motyl'),
    Flashcard('Car', 'Samochód'),
    Flashcard('Cat', 'Kot'),
    Flashcard('Chair', 'Krzesło'),
    Flashcard('City', 'Miasto'),
    Flashcard('Clothes', 'Ubrania'),
    Flashcard('Cloud', 'Chmura'),
    Flashcard('Coffee', 'Kawa'),
    Flashcard('Computer', 'Komputer'),
    Flashcard('Cookie', 'Ciastko'),
    Flashcard('Country', 'Kraj'),
    Flashcard('Cousin', 'Kuzyn'),
    Flashcard('Cow', 'Krowa'),
    Flashcard('Cup', 'Kubek'),
    Flashcard('Dad', 'Tata'),
    Flashcard('Dance', 'Taniec'),
    Flashcard('Daughter', 'Córka'),
    Flashcard('Day', 'Dzień'),
    Flashcard('Desk', 'Biurko'),
    Flashcard('Dinner', 'Obiad'),
    Flashcard('Dog', 'Pies'),
    Flashcard('Door', 'Drzwi'),
    Flashcard('Drawing', 'Rysunek'),
    Flashcard('Dream', 'Sen'),
    Flashcard('Dress', 'Sukienka'),
    Flashcard('Drink', 'Napój'),
    Flashcard('Ear', 'Ucho'),
    Flashcard('Earth', 'Ziemia'),
    Flashcard('Egg', 'Jajko'),
    Flashcard('Electricity', 'Elektryczność'),
    Flashcard('Elephant', 'Słoń'),
    Flashcard('Elevator', 'Winda'),
    Flashcard('Email', 'E-mail'),
    Flashcard('Engine', 'Silnik'),
    Flashcard('Evening', 'Wieczór'),
    Flashcard('Eye', 'Oko'),
    Flashcard('Face', 'Twarz'),
    Flashcard('Family', 'Rodzina'),
    Flashcard('Fan', 'Wiatrak'),
    Flashcard('Farm', 'Farma'),
    Flashcard('Father', 'Ojciec'),
    Flashcard('Feet', 'Stopy'),
    Flashcard('Film', 'Film'),
    Flashcard('Finger', 'Palec'),
    Flashcard('Fire', 'Ogień'),
    Flashcard('Fish', 'Ryba'),
  ];

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
        leading: IconButton (
          icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Main()),
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
              borderRadius: BorderRadius.circular(20), // ustalenie zaokrąglenia rogów
              child: Container(
                height: 500,
                width: 330,
                color: Colors.white10,
                child: Center(
                  child: Text(
                    flashcards[index].pageone,
                    style: TextStyle(fontSize: 36, color: Colors.white),
                  ),
                ),
              ),
            ),
            back: ClipRRect(
              borderRadius: BorderRadius.circular(20), // ustalenie zaokrąglenia rogów
              child: Container(
                height: 500,
                width: 330,
                color: Colors.lime,
                child: Center(
                  child: Text(
                    flashcards[index].pagetwo,
                    style: TextStyle(fontSize: 36, color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 125,
                decoration: BoxDecoration(
                  color: Colors.lime,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios_new),
                  color: Colors.cyan,
                  onPressed: _prevFlashcard,
                ),
              ),
              Container(
                width: 125,
                decoration: BoxDecoration(
                  color: Colors.lime,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  color: Colors.cyan,
                  onPressed: _nextFlashcard,
                ),
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

