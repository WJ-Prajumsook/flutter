import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_forex_app/bloc/price_bloc.dart';
import 'package:flutter_forex_app/model/price.dart';
import 'package:flutter_forex_app/ui/detail_screen.dart';

class TopTenInstrument extends StatefulWidget {
  @override
  _TopTenInstrumentState createState() => _TopTenInstrumentState();
}

class _TopTenInstrumentState extends State<TopTenInstrument> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PriceBloc()
        ..add(
          PriceEventStated(),
        ),
      child: BlocBuilder<PriceBloc, PriceState>(
        builder: (context, state) {
          if (state is PriceLoading) {
            return Center();
          } else if (state is PriceLoaded) {
            List<Price> prices = state.prices;
            return Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  context.read<PriceBloc>()
                    ..add(
                      PriceEventStated(),
                    );
                },
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    Price price = prices[index];
                    final fromFlag =
                        price.instrument.split('_')[0].toLowerCase();
                    final toFlag = price.instrument.split('_')[1].toLowerCase();
                    return Container(
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black.withOpacity(0.05),
                        ),
                        color: Colors.black.withOpacity(0.05),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/images/$fromFlag.png'),
                                      radius: 10,
                                    ),
                                    SizedBox(width: 10),
                                    CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/images/$toFlag.png'),
                                      radius: 10,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                (price.instrument).replaceAll('_', '-'),
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                    ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Bid: ${price.closeoutBid}'.toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                    ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Ask: ${price.closeoutAsk}'.toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                    ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Spread'.toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                    ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '${calSpread(double.parse(price.closeoutAsk), double.parse(price.closeoutBid))} %',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                    ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailScreen(
                                            instrument: price.instrument),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.navigate_next,
                                    color: Colors.red[500],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10);
                  },
                  itemCount: prices.length,
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  String calSpread(double ask, double bid) {
    double spreadPersent = ((ask - bid) / ask) * 100;
    return spreadPersent.toStringAsFixed(4).toString();
  }
}
