import 'package:cryptocurrencies_dashboard_app/menu_controller.dart';
import 'package:cryptocurrencies_dashboard_app/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopMenu extends StatefulWidget {
  @override
  _TopMenuState createState() => _TopMenuState();
}

class _TopMenuState extends State<TopMenu> {
  final List _isHovering = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      color: Colors.blueGrey.shade900,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if(Responsive.isSmallScreen(context)) IconButton(
              onPressed: context.read<MenuController>().controlMenu,
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
            Text(
              'Crypto-Dashboard',
              style: Theme.of(context).textTheme.headline5!.copyWith(
                color: Colors.white,
              ),
            ),
            if(!Responsive.isSmallScreen(context)) Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        value ? _isHovering[0] = true : _isHovering[0] = false;
                      });
                    },
                    onTap: () {},
                    child: Text(
                      'Settings'.toUpperCase(),
                      style: TextStyle(
                        color: _isHovering[0] ? Colors.white : Colors.white70,
                      ),
                    ),
                  ),
                  SizedBox(width: _screenSize.width / 50),
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        value ? _isHovering[1] = true : _isHovering[1] = false;
                      });
                    },
                    onTap: () {},
                    child: Text(
                      'Login'.toUpperCase(),
                      style: TextStyle(
                        color: _isHovering[1] ? Colors.white : Colors.white70,
                      ),
                    ),
                  ),
                  SizedBox(width: _screenSize.width / 50),
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        value ? _isHovering[2] = true : _isHovering[2] = false;
                      });
                    },
                    onTap: () {},
                    child: Text(
                      'Sign Up'.toUpperCase(),
                      style: TextStyle(
                        color: _isHovering[2] ? Colors.white : Colors.white70,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
