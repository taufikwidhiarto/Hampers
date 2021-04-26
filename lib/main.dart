import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hamper/components/bottom_bar/bottom_bar.dart';
import 'package:hamper/pages/cart/cart_page.dart';
import 'package:hamper/pages/explore/explore_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //top bar color
      statusBarIconBrightness: Brightness.light, //top bar icons
      // systemNavigationBarColor: Colors.white, //bottom bar color
      // systemNavigationBarIconBrightness: Brightness.dark, //bottom bar icons
    ));
    return MaterialApp(
      title: 'Hampers',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _pages = <Widget>[
    ExplorePage(),
    CartPage(),
    ExplorePage(),
  ];

  static List<BottomNavigationBarItem> _bottomItem = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        label: 'Explore',
        backgroundColor: Colors.purple),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_basket_outlined),
        label: 'Cart',
        backgroundColor: Colors.red),
    BottomNavigationBarItem(
        icon: Icon(Icons.account_circle_outlined),
        label: 'Profile',
        backgroundColor: Colors.blue)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 72,
        title: Text(_bottomItem[_selectedIndex].label ?? '',
            style: GoogleFonts.balooBhai(
                textStyle: TextStyle(
                    fontSize: 34,
                    color: _bottomItem[_selectedIndex].backgroundColor,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1))),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: _pages[_selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: BottomBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: _bottomItem,
      ),
    );
  }
}
