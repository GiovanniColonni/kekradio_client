import 'package:flutter/material.dart';
import 'package:kekradio_client/ui/drawer.dart';
import 'package:kekradio_client/ui/qrz.dart';
import 'package:kekradio_client/ui/repeaters.dart';
import 'package:kekradio_client/ui/signin.dart';
import 'package:kekradio_client/ui/signup.dart';
import 'constants/constants.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        SIGN_IN: (BuildContext context) => SignInPage(),
        SIGN_UP: (BuildContext context) => SignUpScreen(),
      },
      title: 'KekRadio',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'KekRadio Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    final _pages = <Widget>[
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to KekRadio',
            ),
          ],
        ),
      ),
      new Repeaters(),
      new QRZ(),
      new SignInPage()
    ];

    return Scaffold(
      drawer: Drawer(
        child: drawerItems,
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.radio), title: Text('Repeaters')),
          BottomNavigationBarItem(
              icon: Icon(Icons.wifi_tethering), title: Text("QRZ")),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle), title: Text("login"))
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
