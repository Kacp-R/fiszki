//kacper
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';

class Stats extends StatefulWidget {
  final int cAnswers;
  final int tAnswers;
  Stats({required this.cAnswers, required this.tAnswers});
  @override
  StatsState createState() => StatsState(cAnswers, tAnswers);
}

class StatsState extends State<Stats> {
  final int cAnswers;
  final int tAnswers;
  final Map<String, double> dataMap;

  StatsState(this.cAnswers, this.tAnswers)
  :dataMap = {'Poprawne': double.parse(cAnswers.toString()),'Niepoprawne': double.parse((tAnswers-cAnswers).toString())};
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
            style: TextStyle(fontSize: 24.0, color: Colors.white),
          ),
          Text(
            '$cAnswers',
            style: TextStyle(fontSize: 24.0, color: Colors.white),
          ),
          Text(
            '$tAnswers',
            style: TextStyle(fontSize: 24.0, color: Colors.white),
          ),
          PieChart(dataMap: dataMap, chartRadius: 80, legendOptions: LegendOptions(legendTextStyle: TextStyle(color: Colors.white)),)
        ],
        ),
      ),
    );
  }
}