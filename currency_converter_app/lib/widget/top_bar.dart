import 'package:flutter/material.dart';

class TopBar extends StatefulWidget {
  const TopBar({
    Key? key,
    required this.opacity,
  }) : super(key: key);

  final double opacity;

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  final List _isHovering = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.blueGrey.shade900.withOpacity(widget.opacity),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Text(
              'EX-Rate',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
              ),
            ),
            Expanded(
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
                      'Sign Up'.toUpperCase(),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
