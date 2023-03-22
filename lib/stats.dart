//kacper
import 'package:pie_chart/pie_chart.dart';
import 'package:fiszki/main_page.dart';
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
      : dataMap = {
          'Correct': double.parse(cAnswers.toString()),
          'Incorrect ': double.parse((tAnswers - cAnswers).toString())
        };

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
          children: [
            Text(
              'Stats',
              style: TextStyle(fontSize: 40.0, color: Colors.white,fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 20,
            ),
            PieChart(
              dataMap: dataMap,
              chartRadius: 230,
              colorList: [
                Colors.lime,
                Colors.red,
              ],
              legendOptions: LegendOptions(
                  legendTextStyle: TextStyle(color: Colors.white)),
              chartValuesOptions: ChartValuesOptions(decimalPlaces: 0),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '🟢 Correct answers: $cAnswers',
              style: TextStyle(fontSize: 24.0, color: Colors.white),
            ),
            Text(
              "   🔴 Incorrect answers: ${tAnswers - cAnswers}",
              style: TextStyle(fontSize: 24.0, color: Colors.white),
            ),
            Text(
              '🍭 Total answers: $tAnswers   ',
              style: TextStyle(fontSize: 24.0, color: Colors.white),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "${(cAnswers / tAnswers * 100).toStringAsFixed(2)}% correct answers",
              style: TextStyle(fontSize: 35.0, color: Colors.white,fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}
