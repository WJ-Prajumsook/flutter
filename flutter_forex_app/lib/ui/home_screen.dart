import 'package:flutter/material.dart';
import 'package:flutter_forex_app/ui/price_eur_usd.dart';
import 'package:flutter_forex_app/ui/top_ten_instruments.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              Colors.blue[900],
              Colors.blue[300],
              Colors.blue[900],
              Colors.blue[200],
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height / 2.6,
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 25),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.menu,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    PriceEurUsd(),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(65),
                    topRight: Radius.circular(65),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Text(
                        'top 10 instruments'.toUpperCase(),
                        style: Theme.of(context).textTheme.caption.copyWith(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                      ),
                    ),
                    SizedBox(height: 30),
                    TopTenInstrument(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
