import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class total_bar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(),
    );
  }
}
class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  late List<_ChartData> data_1, data_2;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data_1 = [
      _ChartData('1~5', 169.4),
      _ChartData('6~10', 158.8),
      _ChartData('11~15', 172.6),
      _ChartData('16~20', 170.2),
      _ChartData('21~25', 154.6),
      _ChartData('26~30', 161.6),
      _ChartData('31~35', 169.6),
      _ChartData('36~40', 168.4),
      _ChartData('41~45', 164.4)
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('총 횟수 통계'),
        ),
        body: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(minimum: 0, maximum: 200, interval: 50),
            tooltipBehavior: _tooltip,
            series: <ChartSeries<_ChartData, String>>[
              ColumnSeries<_ChartData, String>(
                  dataSource: data_1,
                  xValueMapper: (_ChartData data_1, _) => data_1.x,
                  yValueMapper: (_ChartData data_1, _) => data_1.y,
                  name: '세부사항',
                  color: Color.fromRGBO(8, 142, 255, 1)
              )
            ]));
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
