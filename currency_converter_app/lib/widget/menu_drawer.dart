import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              DrawerHeader(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage('assets/images/logo.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'EX-Rate',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                onTap: () {},
                horizontalTitleGap: 0.0,
                leading: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 22,
                    minHeight: 22,
                    maxWidth: 22,
                    maxHeight: 22,
                  ),
                  child: Image.asset('assets/images/sign_up.png'),
                ),
                title: Text('Sign Up'),
              ),
              ListTile(
                onTap: () {},
                horizontalTitleGap: 0.0,
                leading: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 22,
                    minHeight: 22,
                    maxWidth: 22,
                    maxHeight: 22,
                  ),
                  child: Image.asset('assets/images/login.png'),
                ),
                title: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
