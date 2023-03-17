import 'package:flutter/material.dart';
import 'package:fiszki/main_page.dart';
import 'dart:math';

class WritingPrac extends StatefulWidget {
  @override
  WritingPracState createState() => WritingPracState();
}

class WritingPracState extends State<WritingPrac> {
  int _cAnswers = 0;
  int _tAnswers = 0;
  final List<String> english = [
    'Apple', 'Banana', 'Cherry', 'Dog', 'Elephant', 'Football', 'Guitar', 'House', 'Ice cream', 'Jacket'
  ];
  final List<String> polish = [
    'Jablko', 'Banan', 'Wisnia', 'Pies', 'Slon', 'Pilkanozna', 'Gitara', 'Dom', 'lody', 'kurtka'
  ];
  int lb = Random().nextInt(10);
  String jen = "EN >>> PL";
  String que = 'TEST';
  String odp = '', dz = "", podane = "";

  @override
  void initState() {
    super.initState();
    losuj();
  }

  void losuj(){
      lb = Random().nextInt(10);
      setState(() {
        odp = english[lb];
      });
  }
  sprawdz() {
    setState(() {
      que = "";
      if(podane.toLowerCase() == polish[lb].toLowerCase()){
        dz = "DOBRZE!!!";
        _cAnswers++;
      }
      else{
        dz = "ZLE>:(";
      }
      _tAnswers++;
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
              MaterialPageRoute(builder: (context) => Main(cAnswers: _cAnswers, tAnswers: _tAnswers)),
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
            TextFormField(
              decoration: InputDecoration(
                labelText: 'ODPOWIEDZ',
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                setState(() {
                  podane = text;
                });
              },
            ),
            Text(
              dz,
              style: TextStyle(fontSize: 24.0),
            ),
            ElevatedButton(
              onPressed: sprawdz,
              child: Text('Sprawdz'),
            ),
          ],
        ),
      ),
    );
  }
}
