import 'package:flutter/material.dart';
import '../chart/total_pie_chart.dart';
import '../chart/fifty_pie_chart.dart';

class Pie_chart extends StatelessWidget {
  const Pie_chart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
          child: ListView(
            children: [
              Column(
                children: const [
                  Text(
                    '50 횟수 비율',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  PieChartSample1(),
                  Text(
                    '총 횟수 비율',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  PieChartSample2(),
                ],
              ),
            ],
          ),
        )));
  }
}
