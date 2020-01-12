import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uptime/TaskTabRoute.dart';
import 'package:uptime/bottombar.dart';
import 'package:uptime/timeConuntPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => AppHome(),
      },
    );
  }
}

class AppHome extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<AppHome> {
  List _bodyList = [TimeCountPage(), TaskTabRoute()];
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _bodyList[_index],
          Padding(
            padding: EdgeInsets.only(bottom: 50),
            child: BottomBar(
              onPress1: () {
                setState(() {
                  _index = 0;
                });
              },
              onPress2: () {
                setState(() {
                  _index = 1;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
