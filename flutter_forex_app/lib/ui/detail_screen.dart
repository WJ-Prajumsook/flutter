import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_forex_app/bloc/candles_bloc.dart';
import 'package:flutter_forex_app/bloc/price_info_bloc.dart';
import 'package:flutter_forex_app/model/candles.dart';
import 'package:flutter_forex_app/model/price.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DetailScreen extends StatefulWidget {
  final String instrument;

  const DetailScreen({Key key, @required this.instrument}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState(this.instrument);
}

class _DetailScreenState extends State<DetailScreen> {
  final String instrument;
  String granularity = 'M15';

  _DetailScreenState(this.instrument);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CandlesBloc()
            ..add(
              CandlesEventStated(instrument, granularity),
            ),
        ),
        BlocProvider(
          create: (_) => PriceInfoBloc()
            ..add(
              PriceInfoEventStated(instrument),
            ),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(
                  '$instrument'.replaceAll('_', ' / '),
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
                leading: Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.05),
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.navigate_before,
                        size: 24,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 520,
                child: BlocBuilder<CandlesBloc, CandlesState>(
                  builder: (context, state) {
                    if (state is CandlesLoading) {
                      return Center(
                        child: Platform.isAndroid
                            ? CircularProgressIndicator()
                            : CupertinoActivityIndicator(),
                      );
                    } else if (state is CandlesLoaded) {
                      Candles candles = state.candles;
                      List<CandleData> candleData =
                          createChartData(candles.candles);
                      return Padding(
                        padding: EdgeInsets.zero,
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      buildGranularity(context, '10S', 'S10'),
                                      buildGranularity(context, '15S', 'S15'),
                                      buildGranularity(context, '30S', 'S30'),
                                      buildGranularity(context, '10M', 'M10'),
                                      buildGranularity(context, '15M', 'M15'),
                                      buildGranularity(context, '30M', 'M30'),
                                      buildGranularity(context, 'H', 'H1'),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 480,
                                child: SfCartesianChart(
                                  primaryXAxis: DateTimeAxis(
                                    visibleMinimum: candleData[0].x,
                                    visibleMaximum:
                                        candleData[candleData.length - 1].x,
                                    edgeLabelPlacement:
                                        EdgeLabelPlacement.shift,
                                    intervalType: DateTimeIntervalType.auto,
                                  ),
                                  series: <ChartSeries<CandleData, DateTime>>[
                                    CandleSeries(
                                      dataSource: candleData,
                                      xValueMapper: (CandleData c, _) => c.x,
                                      lowValueMapper: (CandleData c, _) =>
                                          c.low,
                                      highValueMapper: (CandleData c, _) =>
                                          c.high,
                                      openValueMapper: (CandleData c, _) =>
                                          c.open,
                                      closeValueMapper: (CandleData c, _) =>
                                          c.close,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
              Expanded(
                child: BlocBuilder<PriceInfoBloc, PriceInfoState>(
                  builder: (context, state) {
                    if (state is PriceInfoLoading) {
                      return Center(
                        child: Platform.isAndroid
                            ? CircularProgressIndicator()
                            : CupertinoActivityIndicator(),
                      );
                    } else if (state is PriceInfoLoaded) {
                      Price price = state.price;
                      return Padding(
                        padding: EdgeInsets.all(20),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Instrument ${price.instrument}'
                                          .replaceAll('_', ' / '),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54),
                                    ),
                                    Text(
                                      'Spread ${calSpread(double.parse(price.closeoutAsk), double.parse(price.closeoutBid))} %',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 25),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(25),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.05),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(bottom: 5),
                                          child: Text(
                                            'Date ${price.time}'
                                                .split('.')[0]
                                                .replaceAll('T', ' '),
                                            style: TextStyle(
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            'Closeout Bid ${price.closeoutBid}',
                                            style: TextStyle(
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(bottom: 5),
                                          child: Text(
                                            'Tradeable ${price.tradeable}',
                                            style: TextStyle(
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            'Closeout Ask ${price.closeoutAsk}',
                                            style: TextStyle(
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 25),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      width: 180,
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.08),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Follow'.toUpperCase(),
                                          style: TextStyle(
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 180,
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color: Colors.black54,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Follow'.toUpperCase(),
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGranularity(BuildContext context, String title, String gran) {
    return InkWell(
      onTap: () {
        setState(
          () {
            granularity = gran;
            context.read<CandlesBloc>()
              ..add(
                CandlesEventStated(instrument, granularity),
              );
          },
        );
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: (granularity == gran) ? Colors.black54 : Colors.white,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
        ),
      ),
    );
  }

  String calSpread(double ask, double bid) {
    double spreadPersent = ((ask - bid) / ask) * 100;
    return spreadPersent.toStringAsFixed(4).toString();
  }

  List<CandleData> createChartData(List<Candle> candles) {
    List<CandleData> candleData = [];
    candles.forEach((candle) {
      final c = CandleData(
        x: DateTime.parse(candle.time),
        open: double.parse(candle.candleItem.open),
        high: double.parse(candle.candleItem.high),
        low: double.parse(candle.candleItem.low),
        close: double.parse(candle.candleItem.close),
      );
      candleData.add(c);
    });
    return candleData;
  }
}

class CandleData {
  final DateTime x;
  final double open;
  final double high;
  final double low;
  final double close;

  CandleData({this.x, this.open, this.high, this.low, this.close});
}
