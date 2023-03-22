import 'package:flutter/material.dart';
import 'package:fiszki/main_page.dart';
import 'dart:math';
//Hej, Nikita! Tu KAcpR, Zamiast tych dwóch list zrob funkcję, która importuje flashcards_list,
// i dla każdego indexu robi( english[i] = flashcards[i].pageone;  polish[i] = flashcards[i].pagetwo; ).
// Zmniejszy to ilość kodu, i zwiększy ilość pytań.

class WritingPrac extends StatefulWidget {
  final int cAnswers, tAnswers;

  const WritingPrac({super.key, required this.cAnswers, required this.tAnswers});
  @override
  WritingPracState createState() => WritingPracState(cAnswers, tAnswers);
}

class WritingPracState extends State<WritingPrac> {
  final fieldText = TextEditingController();
  final List<String> english = [
    'wealth', 'smelly', 'lace', 'doll', 'coach', 'eight', 'needy', 'breezy', 'vagabond', 'defiant', 'theory', 'rich', 'disgusting', 'day', 'word', 'literate', 'overrated', 'cat', 'label', 'shy', 'staking', 'radiate', 'repeat', 'silent', 'eye', 'houses', 'elite', 'four', 'calculating', 'hate', 'choke', 'pull', 'sun', 'spooky', 'early', 'abortive', 'kitty', 'farm', 'steadfast', 'memory', 'pen', 'telephone', 'tail', 'collar', 'mundane', 'synonymous', 'exercise', 'inconclusive', 'reduce', 'two',
  ];
  final List<String> polish = [
    'bogactwo', 'śmierdzący', 'koronka', 'lalka', 'trener', 'ósemka', 'potrzebujący', 'brednie', 'wagabunda', 'wyuzdany', 'teoria', 'bogaty', 'obrzydliwy', 'dzień', 'słowo', 'literat', 'przereklamowany', 'kot', 'etykieta', 'nieśmiały', 'uderzenie', 'promieniowanie', 'powtarzanie', 'cichy', 'oko', 'domy', 'elita', 'cztery', 'wyrachowanie', 'nienawiść', 'dusić', 'ciągnąć', 'słońce', 'upiorny', 'wczesny', 'poroniony', 'kotek', 'gospodarstwo', 'niezłomny', 'pamięć', 'pióro', 'telefon', 'ogon', 'obroża', 'prozaiczny', 'synonim', 'ćwiczenie', 'nierozstrzygający', 'redukować', 'dwa',
  ];
  int lb = Random().nextInt(10);
  String que = 'TEST';
  String odp = '', dz = "", podane = "", jen = "";
  int streak = 0;
  int cAnswers, tAnswers;

  WritingPracState(this.cAnswers, this.tAnswers);
  @override
  void initState() {
    super.initState();
    start();
  }
  void start(){
    odp = '';
    dz = "";
    podane = "";
    jen = "";
    if(Random().nextBool() == true){
      jen = "EN --> PL";
    }
    else{
      jen = "PL --> EN";
    }
    losuj();
  }
  void losuj(){
      lb = Random().nextInt(50);
      setState(() {
        if(jen == "EN --> PL") {
          odp = english[lb];
        }
        else if(jen == "PL --> EN"){
          odp = polish[lb];
        }
      });
  }
  void sprawdz() {
    setState(() {
      que = "";
      if(jen == "EN --> PL"){
        if(podane.toLowerCase() == polish[lb].toLowerCase()){
          dz = "DOBRZE!!!";
          streak++;
          cAnswers++;
        }
        else{
          dz = "ZLE>:(";
          streak = 0;
        }
      }
      else if(jen == "PL --> EN"){
        if(podane.toLowerCase() == english[lb].toLowerCase()){
          dz = "DOBRZE!!!";
          streak++;
          cAnswers++;
        }
        else{
          dz = "ZLE>:(";
          streak = 0;
        }
      }
      tAnswers++;
    });
  }

  void nastepne(){
    fieldText.clear();
    if(dz == "DOBRZE!!!"){
      start();
    }
    else{
      streak = 0;
      start();
    }
  }
  //dodac style
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
                  builder: (context) => Main(cAnswers: cAnswers, tAnswers: tAnswers)),
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              child:Text(
                jen,
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child:Text(
                odp,
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child:TextField(
                decoration: InputDecoration(
                  labelText: 'ODPOWIEDŹ',
                  labelStyle: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 24.0,
                    ),
                  ),
                ),
                onChanged: (text) {
                  setState(() {
                    podane = text;
                  });
                },
                controller: fieldText,
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child:Text(
                dz,
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child:Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: sprawdz,
                        child: Text('Sprawdz'),
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(80, 40)),
                          padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: nastepne,
                        child: Text('Nastepne'),
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(80, 40)),
                          padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child:Text(
                "streak: " + streak.toString(),
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
