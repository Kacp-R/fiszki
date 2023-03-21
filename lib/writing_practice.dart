import 'package:flutter/material.dart';
import 'package:fiszki/main_page.dart';
import 'dart:math';

class WritingPrac extends StatefulWidget {
  @override
  WritingPracState createState() => WritingPracState();
}

class WritingPracState extends State<WritingPrac> {
  final fieldText = TextEditingController();
  final List<String> english = [
    'Apple', 'Banana', 'Cherry', 'Dog', 'Elephant', 'Football', 'Guitar', 'House', 'Ice cream', 'Jacket'
  ];
  final List<String> polish = [
    'Jablko', 'Banan', 'Wisnia', 'Pies', 'Slon', 'Pilkanozna', 'Gitara', 'Dom', 'lody', 'kurtka'
  ];
  int lb = Random().nextInt(10);
  String que = 'TEST';
  String odp = '', dz = "", podane = "", jen = "";
  int streak = 0;
  int cAnswers = 0, tAnswers = 0;
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
      jen = "EN >>> PL";
    }
    else{
      jen = "PL >>> EN";
    }
    losuj();
  }
  void losuj(){
      lb = Random().nextInt(10);
      setState(() {
        if(jen == "EN >>> PL") {
          odp = english[lb];
        }
        else if(jen == "PL >>> EN"){
          odp = polish[lb];
        }
      });
  }
  void sprawdz() {
    setState(() {
      que = "";
      if(jen == "EN >>> PL"){
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
      else if(jen == "PL >>> EN"){
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              jen,
              style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
              ),
            ),
            Text(
              odp,
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
              ),
            ),
            TextField(
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
            Text(
              dz,
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
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
            Text(
              "streak: " + streak.toString(),
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
