import 'package:cryptocurrencies_dashboard_app/menu_controller.dart';
import 'package:cryptocurrencies_dashboard_app/provider/crypto_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crypto-Dashboard',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Montserrat',
        disabledColor: Colors.blueGrey.shade900,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuController(),
          ),
          ChangeNotifierProvider(
            create: (context) => CryptoProvider(),
          ),
        ],
        child: HomeScreen(),
      ),
    );
  }
}
          //
