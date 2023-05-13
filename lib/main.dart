import 'package:flutter/material.dart';
import 'package:open_source_project/chart/total_pie_chart.dart';
import 'package:open_source_project/chart/fifty_pie_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'chart/total_bar_chart.dart';
import 'chart/fifty_bar_chart.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:PieChartSample1()
    );
  }
}
