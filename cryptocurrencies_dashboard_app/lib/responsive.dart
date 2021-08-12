import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;

  const Responsive({
    Key? key,
    required this.largeScreen,
    required this.mediumScreen,
    required this.smallScreen,
  }) : super(key: key);

  static bool isLargeScreen(BuildContext context) => MediaQuery.of(context).size.width >= 1200;

  static bool isMediumScreen(BuildContext context) => MediaQuery.of(context).size.width < 1200 && MediaQuery.of(context).size.width >= 800;

  static bool isSmallScreen(BuildContext context) => MediaQuery.of(context).size.width < 800;


  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    if(_size.width >= 1100) {
      return largeScreen;
    } else if(_size.width >= 850) {
      return mediumScreen;
    } else {
      return smallScreen;
    }
  }
}
