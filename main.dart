import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:uptime/analyticsPage/analyticsTab.dart';
import 'package:uptime/model/providerModel.dart';
import 'package:uptime/taskPage/taskTabRoute.dart';
import 'package:uptime/bottomBar.dart';
import 'package:uptime/timeCountPage/timeConuntPage.dart';

void main() {
  runApp(ChangeNotifierProvider<ProviderModel>(
    create: (_) => ProviderModel(),
    child: MyApp(),
  ));
}

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
  List _bodyList = [TimeCountPage(), AnalyticsTab(), TaskTabRoute()];
  int _index = 0;

  @override
  void initState() {
    Provider.of<ProviderModel>(context, listen: false).initData();
    super.initState();
  }

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
              onPress3: () {
                setState(() {
                  _index = 2;
                });
              },
            ),
          )
        ],
      ),
      resizeToAvoidBottomPadding: false,
    );
  }
}
