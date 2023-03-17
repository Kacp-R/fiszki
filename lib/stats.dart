//kacper

import 'package:flutter/material.dart';

class Stats extends StatelessWidget {
  final int cAnswers;
  final int tAnswers;
  Stats({required this.cAnswers, required this.tAnswers});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Column(children: [
          Text(
            'stats',
            style: TextStyle(fontSize: 24.0),
          ),
          Text(
            '$cAnswers',
            style: TextStyle(fontSize: 24.0),
          ),
          Text(
            '$tAnswers',
            style: TextStyle(fontSize: 24.0),
          ),
        ],
        ),
      ),
    );
  }
}