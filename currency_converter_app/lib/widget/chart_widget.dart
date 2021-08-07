import 'package:currency_converter_app/model/chart.dart';
import 'package:currency_converter_app/responsive.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({Key? key, required this.fromCurrency, required this.chartData}) : super(key: key);

  final String fromCurrency;
  final List<Indicator> chartData;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                title: ChartTitle(text: 'USD/$fromCurrency Granularity: 1d'),
                legend: !Responsive.isSmallScreen(context) ? Legend(isVisible: true) : Legend(isVisible: false),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<Indicator, String>>[
                  LineSeries<Indicator, String>(
                    dataSource: chartData,
                    xValueMapper: (Indicator ind, _) => ind.timestamp.toString(),
                    yValueMapper: (Indicator ind, _) => ind.adjclose,
                    name: 'USD/$fromCurrency',
                    dataLabelSettings: DataLabelSettings(isVisible: false),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
