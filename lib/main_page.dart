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
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: AssetImage('img/lime.png')
                ,fit: BoxFit.contain,
                height: 200,
              ),
              const SizedBox(
                height: 3.0,
              ),
              const Text(
                'LIME',
                style: TextStyle(color: Colors.lime, fontSize: 55),
              ),
              const Text(
                'your language skills',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(
                height: 50.0,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FlashcardsPage(cAnswers: cAnswers, tAnswers: tAnswers,)),
                  );
                },
                child: const Text(
                  'Flashcards',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                padding: const EdgeInsets.all(25),
                minWidth: 350, //ustawianie szerokości przycisku
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WritingPrac()),
                  );
                },
                child: const Text('Writing practice',
                  style: TextStyle(color: Colors.white,fontSize: 20),),
                padding: const EdgeInsets.all(25),
                minWidth: 350, //ustawianie szerokości przycisku
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Stats(cAnswers: cAnswers, tAnswers: tAnswers,)),
                  );
                },
                child: const Text('Stats',
                  style: TextStyle(color: Colors.white,fontSize: 20),),
                padding: const EdgeInsets.all(25),
                minWidth: 350, //ustawianie szerokości przycisku
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      );
  }
}
