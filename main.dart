import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uptime/ball.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
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
  final double _top = 50;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(top: _top),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20, top: 5),
                child: Text(
                  "番茄钟",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Ball(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
