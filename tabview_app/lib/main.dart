import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color(0xFFF6F5EE),
        textTheme:
            GoogleFonts.robotoTextTheme(Theme.of(context).textTheme).apply(
          bodyColor: Colors.grey,
        ),
      ),
      home: const MyHomeScreen(),
    );
  }
}

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 60,
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                background: SafeArea(
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Color(0xFFF1F0EA),
                      borderRadius: BorderRadius.all(
                        Radius.circular(35),
                      ),
                    ),
                    child: Center(
                      child: TabBar(
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        labelColor: const Color(0xFF142A8F),
                        unselectedLabelColor: const Color(0xFF525354),
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        unselectedLabelStyle: const TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                        tabs: const [
                          Tab(text: 'Wallet'),
                          Tab(text: 'Rewards'),
                          Tab(text: 'Activity'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height + 100,
                child: TabBarView(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Container(
                            height: 250,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      'PayOne balance',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      '0,00 USD',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 65),
                                const Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    '0,00 USD',
                                    style: TextStyle(
                                      fontSize: 45,
                                      color: Color(0xFF152B8E),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              top: 15,
                              bottom: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Banks and Cards',
                                  style: TextStyle(
                                    color: Color(0xFF525354),
                                  ),
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.add,
                                    color: Color(0xFF525354),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 250,
                            width: double.infinity,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: const [
                                Text(
                                  'Add banks and cards',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Link cars to shop and pay with PayOne, and link banks to withdraw from your PayOne balance.',
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 250,
                            width: double.infinity,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                const Text(
                                  'Preferences',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                ListTile(
                                  leading: const Icon(
                                    Icons.shopping_bag,
                                    color: Color(0xFF152B8E),
                                  ),
                                  title: const Text('Online purchases'),
                                  horizontalTitleGap: 0,
                                  onTap: () {},
                                ),
                                ListTile(
                                  leading: const Icon(
                                    Icons.qr_code_2,
                                    color: Color(0xFF152B8E),
                                  ),
                                  title: const Text('QR code purchases'),
                                  horizontalTitleGap: 0,
                                  onTap: () {},
                                ),
                                ListTile(
                                  leading: const Icon(
                                    Icons.paid,
                                    color: Color(0xFF152B8E),
                                  ),
                                  title: const Text('Automatic payments'),
                                  horizontalTitleGap: 0,
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 20, left: 15, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 250,
                            width: double.infinity,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Rewards'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 20, left: 15, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 250,
                            width: double.infinity,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Activity'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: const Color(0xFF152B8E),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard,
                size: 32,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.attach_money,
                size: 32,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.payment,
                size: 32,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
