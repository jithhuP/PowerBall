import 'package:flutter/material.dart';
import '../chart/total_Bar_chart.dart';
import '../chart/fifty_Bar_chart.dart';

class Bar_chart extends StatelessWidget {
  const Bar_chart({Key? key}) : super(key: key);
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
                        '50 횟수 구간 평균',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      fifty_Bar_chart(),
                      Text(
                        '총 횟수 구간 평균',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      total_Bar_chart(),
                    ],
                  ),
                ],
              ),
            )
        )
    );
  }
}
