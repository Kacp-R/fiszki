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
        }
        else{
          dz = "ZLE>:(";
          streak = 0;
        }
      }
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              jen,
              style: TextStyle(fontSize: 24.0),
            ),
            Text(
              que,
              style: TextStyle(fontSize: 24.0),
            ),
            Text(
              odp,
              style: TextStyle(fontSize: 24.0),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'ODPOWIEDZ',
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                setState(() {
                  podane = text;
                });
              },
              controller: fieldText,
            ),
            Text(
              dz,
              style: TextStyle(fontSize: 24.0),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: sprawdz,
                  child: Text('Sprawdz'),
                ),
                ElevatedButton(
                  onPressed: nastepne,
                  child: Text('Nastepne'),
                ),
              ],
            ),
            Text(
              "streak: " + streak.toString(),
              style: TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      ),
    );
  }
}
