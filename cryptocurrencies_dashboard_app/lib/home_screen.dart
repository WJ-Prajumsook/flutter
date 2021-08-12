import 'package:cryptocurrencies_dashboard_app/menu_controller.dart';
import 'package:cryptocurrencies_dashboard_app/responsive.dart';
import 'package:cryptocurrencies_dashboard_app/widget/quote_list_widget.dart';
import 'package:cryptocurrencies_dashboard_app/widget/side_menu.dart';
import 'package:cryptocurrencies_dashboard_app/widget/top_chart_widget.dart';
import 'package:cryptocurrencies_dashboard_app/widget/top_menu.dart';
import 'package:cryptocurrencies_dashboard_app/widget/top_quote_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size(_screenSize.width, 1000),
        child: TopMenu(),
      ),
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(Responsive.isLargeScreen(context)) Expanded(
              child: SideMenu(),
            ),
            Expanded(
              flex: 5,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TopChartWidget(),
                      SizedBox(height: 25),
                      TopQuoteWidget(),
                      SizedBox(height: 25),
                      QuoteListWidget(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
