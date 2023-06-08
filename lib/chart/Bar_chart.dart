import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Bar_chart extends StatefulWidget {
  const Bar_chart({super.key});
  @override
  State<StatefulWidget> createState() => _BarDefaultState();
}

class _BarDefaultState extends State {
  _BarDefaultState();
  List<ChartSampleData>? chartData;

  @override
  void initState() {
    chartData = <ChartSampleData>[
      ChartSampleData(
          '1~5',
          166,
          100,
          50),
      ChartSampleData(
          '6~10',
          55,
          60,
          65),
      ChartSampleData(
          '11~15',
          70,
          76,
          75),
      ChartSampleData(
          '16~20',
          102,
          160,
          145),
      ChartSampleData(
          '21~25',
          155,
          164,
          145),
      ChartSampleData(
          '26~30',
          143,
          167,
          146),
      ChartSampleData('31~35', 120, 149, 130),
      ChartSampleData('36~40', 119, 112, 114),
      ChartSampleData('41~45', 132, 123, 111)
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildDefaultBarChart();
  }

  SfCartesianChart _buildDefaultBarChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text:'50 횟수와 총 횟수 빈도 비교'),
      legend: Legend(isVisible:true ),
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
          majorGridLines: const MajorGridLines(width: 0),
          numberFormat: NumberFormat.compact()),
      series: _getDefaultBarSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  List<BarSeries<ChartSampleData, String>> _getDefaultBarSeries() {
    return <BarSeries<ChartSampleData, String>>[
      BarSeries<ChartSampleData, String>(
          dataSource: chartData!,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          name: '50 횟수'),
      BarSeries<ChartSampleData, String>(
          dataSource: chartData!,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue,
          name: '총 횟수'),
    ];
  }

  @override
  void dispose() {
    chartData!.clear();
    super.dispose();
  }
}
class ChartSampleData {
  ChartSampleData(this.x, this.y, this.secondSeriesYValue, this.thirdSeriesYValue );
  final String x;
  final int y;
  final int secondSeriesYValue;
  final int thirdSeriesYValue;
}