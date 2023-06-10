import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class fifty_Bar_chart extends StatefulWidget {
  const fifty_Bar_chart({super.key});
  @override
  State<StatefulWidget> createState() => _BarDefaultState();
}

class _BarDefaultState extends State {
  _BarDefaultState();
  List<ChartSampleData>? chartData;

  @override
  void initState() {
    chartData = <ChartSampleData>[
      ChartSampleData('1~5', 170.4, 7),
      ChartSampleData('6~10', 160, 7.6),
      ChartSampleData('11~15', 173, 8.4),
      ChartSampleData('16~20', 171.8, 8.4),
      ChartSampleData('21~25', 155.8, 7.4),
      ChartSampleData('26~30', 162.4, 8.2),
      ChartSampleData('31~35', 170.8, 10.2),
      ChartSampleData('36~40', 168.6, 6.2),
      ChartSampleData('41~45', 165.2, 6.6)
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
      legend: Legend(isVisible:false ),
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
          yValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue,
          name: '50 횟수'),
    ];
  }

  @override
  void dispose() {
    chartData!.clear();
    super.dispose();
  }
}
class ChartSampleData {
  ChartSampleData(this.x, this.y, this.secondSeriesYValue);
  final String x;
  final double y;
  final double secondSeriesYValue;
}