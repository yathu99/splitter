import 'package:flutter/material.dart';
import 'package:splitter/models/pie_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChart extends StatefulWidget {
  PieChart({super.key, required this.chartData});
  List chartData = [];

  @override
  State<PieChart> createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {
  late List<PieDisplayGroupData> _chartData;
  late double totalPercentCalVal;
  double normalData(List<PieDisplayGroupData> expenseList) {
    double total = 0;
    for (int i = 0; i < expenseList.length; i++) {
      total += expenseList[i].value;
    }
    return total;
  }

  @override
  void initState() {
    _chartData = widget.chartData.cast<PieDisplayGroupData>();
    totalPercentCalVal = normalData(_chartData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SfCircularChart(
        title: ChartTitle(text: 'Expense Breakdown'),
        legend: Legend(isVisible: true, isResponsive: true),
        series: <CircularSeries>[
          DoughnutSeries<PieDisplayGroupData, String>(
              explode: true,
              explodeIndex: 0,
              //maximumValue: 1200,
              enableTooltip: true,
              dataSource: _chartData,
              xValueMapper: (datum, index) => datum.expenseName,
              yValueMapper: (datum, index) => datum.value,
              dataLabelMapper: (datum, index) =>
                  '${(datum.value * 100 / totalPercentCalVal).toStringAsFixed(1)}%',
              dataLabelSettings: const DataLabelSettings(isVisible: true))
        ],
      ),
    );
  }

  List<PieDisplayGroupData> getChartData() {
    final List<PieDisplayGroupData> chartData = [
      PieDisplayGroupData('Food', 80),
      PieDisplayGroupData('Books', 200),
      PieDisplayGroupData('Parking', 30),
    ];
    return chartData;
  }
}
