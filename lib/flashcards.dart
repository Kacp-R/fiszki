//bartek

import 'dart:math';
import 'package:fiszki/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class Flashcards extends StatelessWidget {
  const Flashcards({super.key});

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
      home: const FlashcardsPage(),
    );
  }
}

class FlashcardsPage extends StatefulWidget {
  const FlashcardsPage({super.key});

  @override
  _FlashcardsPageState createState() => _FlashcardsPageState();
}

class _FlashcardsPageState extends State<FlashcardsPage> {

  //ofc nie pisałem tej listy ręcznie ale i tak sporo czasu na tym zeszło ;///

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
    Flashcard('Flower', 'Kwiat'),
    Flashcard('Food', 'Jedzenie'),
    Flashcard('Foot', 'Stopa'),
    Flashcard('Football', 'Piłka nożna'),
    Flashcard('Forest', 'Las'),
    Flashcard('Friend', 'Przyjaciel'),
    Flashcard('Fruit', 'Owoc'),
    Flashcard('Game', 'Gra'),
    Flashcard('Garage', 'Garaż'),
    Flashcard('Garden', 'Ogród'),
    Flashcard('Gift', 'Prezent'),
    Flashcard('Girl', 'Dziewczyna'),
    Flashcard('Glass', 'Szkło'),
    Flashcard('Glasses', 'Okulary'),
    Flashcard('Glove', 'Rękawiczka'),
    Flashcard('Goat', 'Koza'),
    Flashcard('Gold', 'Złoto'),
    Flashcard('Goodbye', 'Do widzenia'),
    Flashcard('Grass', 'Trawa'),
    Flashcard('Hair', 'Włosy'),
    Flashcard('Hand', 'Ręka'),
    Flashcard('Hat', 'Czapka'),
    Flashcard('Head', 'Głowa'),
    Flashcard('Heart', 'Serce'),
    Flashcard('Helicopter', 'Śmigłowiec'),
    Flashcard('Holiday', 'Wakacje'),
    Flashcard('Idea', 'Pomysł'),
    Flashcard('Ink', 'Tusz'),
    Flashcard('Iron', 'Żelazo'),
    Flashcard('Ice', 'Lód'),
    Flashcard('Island', 'Wyspa'),
    Flashcard('Ivory', 'Kość słoniowa'),
    Flashcard('Incline', 'Wznosić się'),
    Flashcard('Joy', 'Radość'),
    Flashcard('Judge', 'Sędzia'),
    Flashcard('Juice', 'Sok'),
    Flashcard('July', 'Lipiec'),
    Flashcard('Jump', 'Skok'),
    Flashcard('Jungle', 'Dżungla'),
    Flashcard('Junior', 'Młodszy'),
    Flashcard('Jacket', 'Kurtka'),
    Flashcard('Jam', 'Dżem'),
    Flashcard('January', 'Styczeń'),
    Flashcard('Jaw', 'Szczęka'),
    Flashcard('Jazz', 'Jazz'),
    Flashcard('Jeans', 'Dżinsy'),
    Flashcard('Kangaroo', 'Kangur'),
    Flashcard('Key', 'Klucz'),
    Flashcard('Keyboard', 'Klawiatura'),
    Flashcard('Kid', 'Dziecko'),
    Flashcard('King', 'Król'),
    Flashcard('Kitchen', 'Kuchnia'),
    Flashcard('Kite', 'Latawiec'),
    Flashcard('Knife', 'Nóż'),
    Flashcard('Leaf', 'Liść'),
    Flashcard('Learning', 'Nauka'),
    Flashcard('Leg', 'Noga'),
    Flashcard('Library', 'Biblioteka'),
    Flashcard('Life', 'Życie'),
    Flashcard('Light', 'Światło'),
    Flashcard('Lion', 'Lew'),
    Flashcard('Lip', 'Usta'),
    Flashcard('List', 'Lista'),
    Flashcard('Lizard', 'Jaszczurka'),
    Flashcard('Lock', 'Zamek'),
    Flashcard('Lollipop', 'Lizak'),
    Flashcard('Love', 'Miłość'),
    Flashcard('Math', 'Matematyka'),
    Flashcard('Medicine', 'Medycyna'),
    Flashcard('Meeting', 'Spotkanie'),
    Flashcard('Memory', 'Pamięć'),
    Flashcard('Microphone', 'Mikrofon'),
    Flashcard('Milk', 'Mleko'),
    Flashcard('Nail', 'Paznokieć'),
    Flashcard('Name', 'Imię'),
    Flashcard('Nature', 'Natura'),
    Flashcard('Neck', 'Szyja'),
    Flashcard('Needle', 'Igła'),
    Flashcard('Newspaper', 'Gazeta'),
    Flashcard('Night', 'Noc'),
    Flashcard('Notebook', 'Notatnik'),
    Flashcard('Ocean', 'Ocean'),
    Flashcard('Office', 'Biuro'),
    Flashcard('Oil', 'Olej'),
    Flashcard('Olympics', 'Igrzyska olimpijskie'),
    Flashcard('Onion', 'Cebula'),
    Flashcard('Orange', 'Pomarańcza'),
    Flashcard('Oven', 'Piekarnik'),
    Flashcard('Owl', 'Sowa'),
    Flashcard('Pancake', 'Naleśnik'),
    Flashcard('Panda', 'Panda'),
    Flashcard('Pants', 'Spodnie'),
    Flashcard('Paper', 'Papier'),
    Flashcard('Park', 'Park'),
    Flashcard('Parrot', 'Papuga'),
    Flashcard('Pencil', 'Ołówek'),
    Flashcard('Penguin', 'Pingwin'),
    Flashcard('Rain', 'Deszcz'),
    Flashcard('Rainbow', 'Tęcza'),
    Flashcard('Rat', 'Szczur'),
    Flashcard('Reading', 'Czytanie'),
    Flashcard('Restaurant', 'Restauracja'),
    Flashcard('River', 'Rzeka'),
    Flashcard('Sailboat', 'Żaglówka'),
    Flashcard('Sand', 'Piasek'),
    Flashcard('Sandwich', 'Kanapka'),
    Flashcard('Satellite', 'Satelita'),
    Flashcard('School', 'Szkoła'),
    Flashcard('Science', 'Nauka'),
    Flashcard('Sea', 'Morze'),
    Flashcard('Taxi', 'Taksówka'),
    Flashcard('Tea', 'Herbata'),
    Flashcard('Teacher', 'Nauczyciel'),
    Flashcard('Telephone', 'Telefon'),
    Flashcard('Television', 'Telewizja'),
    Flashcard('Tennis', 'Tenis'),
    Flashcard('Thief', 'Złodziej'),
    Flashcard('Think', 'Myśleć'),
    Flashcard('Thirsty', 'Spragniony'),
    Flashcard('Ugly', 'Brzydki'),
    Flashcard('Umbrella', 'Parasol'),
    Flashcard('Uncle', 'Wujek'),
    Flashcard('Under', 'Pod'),
    Flashcard('Understand', 'Rozumieć'),
    Flashcard('Unhappy', 'Nieszczęśliwy'),
    Flashcard('Unique', 'Wyjątkowy'),
    Flashcard('Unit', 'Jednostka'),
    Flashcard('University', 'Uniwersytet'),
    Flashcard('Waiter', 'Kelner'),
    Flashcard('Wall', 'Ściana'),
    Flashcard('Wallet', 'Portfel'),
    Flashcard('Washing machine', 'Pralka'),
    Flashcard('Watch', 'Zegarek'),
    Flashcard('Water', 'Woda'),
    Flashcard('Wedding', 'Ślub'),
    Flashcard('Week', 'Tydzień'),
    Flashcard('Yacht', 'Jacht'),
    Flashcard('Yard', 'Podwórko'),
    Flashcard('Year', 'Rok'),
    Flashcard('Yellow', 'Żółty'),
    Flashcard('Zebra', 'Zebra'),
    Flashcard('Zoo', 'Zoo'),
    Flashcard('Zipper', 'Zamek błyskawiczny'),
    Flashcard('Zone', 'Strefa'),
  ];

  int index = 0;
  List<int> prevIndex = [];

//geez zdecydowanie za dlugo zajelo robienie zeby te funkcje dzialaly
  void _nextFlashcard() {
    setState(() {
      prevIndex.add(index);
      index = Random().nextInt(flashcards.length);
    });
  }

  void _prevFlashcard() {
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
              MaterialPageRoute(builder: (context) => const Main()),
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
                  onPressed: _prevFlashcard,
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
