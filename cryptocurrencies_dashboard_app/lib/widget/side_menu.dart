import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: Container(
                child: Column(
                  children: [
                    Text(
                      'Cryptocurrencies',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Dashboard',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      child: CircleAvatar(
                        radius:  28,
                        child: ClipRect(
                          child: Image.asset('assets/icons/avatar.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            drawerListTile('assets/icons/dashboard.png', 'Dashboard'),
            Divider(height: 0),
            drawerListTile('assets/icons/trend.png', 'Trending Tickers'),
            Divider(height: 0),
            drawerListTile('assets/icons/active.png', 'Most Actives'),
            Divider(height: 0),
            drawerListTile('assets/icons/gainer.png', 'Gainers'),
            Divider(height: 0),
            drawerListTile('assets/icons/loser.png', 'Losers'),
            Divider(height: 0),
            drawerListTile('assets/icons/top.png', 'Top ETFs'),
            Divider(height: 0),
            drawerListTile('assets/icons/currencies.png', 'Currencies'),
            Divider(height: 0),
          ],
        ),
      ),
    );
  }

  ListTile drawerListTile(String iconSrc, String title) {
    return ListTile(
      onTap: () {},
      horizontalTitleGap: 0.0,
      leading: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 20,
          minHeight: 20,
          maxWidth: 20,
          maxHeight: 20,
        ),
        child: Image.asset(iconSrc, color: Colors.redAccent,),
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
