import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/src/ui/home_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
