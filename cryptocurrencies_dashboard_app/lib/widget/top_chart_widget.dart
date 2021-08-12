import 'dart:async';

import 'package:cryptocurrencies_dashboard_app/model/indicator.dart';
import 'package:cryptocurrencies_dashboard_app/provider/crypto_provider.dart';
import 'package:cryptocurrencies_dashboard_app/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TopChartWidget extends StatefulWidget {
  @override
  _TopChartWidgetState createState() => _TopChartWidgetState();
}

class _TopChartWidgetState extends State<TopChartWidget> {
  List<Indicator> _trendingChartData = [];
  String _trendingCurrency = '';
  late Timer timer;

  @override
  void initState() {
    fetchTrendingChartData();
    super.initState();

    // Refresh new data every 5secs.
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      fetchTrendingChartData();
    });
  }

  @override
  void dispose() {
    timer.cancel(); // Stop timer when repaint.
    super.dispose();
  }

  void fetchTrendingChartData() async {
    List<String> tickers = await Provider.of<CryptoProvider>(context, listen: false).fetchTrendingTickers(5);
    List<Indicator> chartData = await Provider.of<CryptoProvider>(context, listen: false).fetchChartData(tickers.first);
    setState(() {
      _trendingChartData = chartData;
      _trendingCurrency = tickers.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(15),
          width: double.infinity,
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(isVisible: false),
            title: ChartTitle(text: 'Trending Tickers - $_trendingCurrency'),
            legend: Responsive.isLargeScreen(context) ? Legend(isVisible: true) : Legend(isVisible: false),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries<Indicator, String>>[
              AreaSeries(
                dataSource: _trendingChartData,
                xValueMapper: (Indicator ind, _) => ind.timestamp.toString(),
                yValueMapper: (Indicator ind, _) => ind.close,
                name: '$_trendingCurrency',
                dataLabelSettings: DataLabelSettings(isVisible: true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
