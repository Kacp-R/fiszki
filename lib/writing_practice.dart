import 'package:flutter/material.dart';
import 'dart:math';

class WritingPrac extends StatefulWidget {
  @override
  WritingPracState createState() => WritingPracState();
}

class WritingPracState extends State<WritingPrac> {
  final List<String> english = [
    'Apple', 'Banana', 'Cherry', 'Dog', 'Elephant', 'Football', 'Guitar', 'House', 'Ice cream', 'Jacket'
  ];
  final List<String> polish = [
    'Jablko', 'Banan', 'Wisnia', 'Pies', 'Slon', 'Pilkanozna', 'Gitara', 'Dom', 'lody', 'kurtka'
  ];
  int lb = Random().nextInt(10);
  String jen = "EN >>> PL";
  String que = 'AMONGUS';
  String odp = '', dz = "", podane = "";


  void losuj(){
      lb = Random().nextInt(10);
      setState(() {
        odp = english[lb];
      });
  }
  void Sprawdz() {
      if(podane == polish[lb]){
          dz = "DOBRZE!!!";
      }
      else{
          dz = "ZLE>:(";
      }
  }
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
              onPressed: Sprawdz,
              child: Text('Sprawdz'),
            ),
          ],
        ),
      ),
    );
  }
}
