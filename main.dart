import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:littledecisive/analyticsPage/analyticsTab.dart';
import 'package:provider/provider.dart';

import 'bottomBar.dart';
import 'model/providerModel.dart';
import 'taskPage/taskTabRoute.dart';
import 'timeCountPage/timeConuntPage.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

void main() async {
  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

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
  List<Widget> _bodyList = [TimeCountPage(), AnalyticsTab(), TaskTabRoute()];
  int _index = 0;

  @override
  void initState() {
    Provider.of<ProviderModel>(context, listen: false).initData();
    var initializationSettingsAndroid = AndroidInitializationSettings('flag');
    var initializationSettingsIOS = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: IndexedStack(
              index: _index,
              children: _bodyList,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 50),
            child: BottomBar(
              onPress1: () {
                SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
                setState(() {
                  _index = 0;
                });
              },
              onPress2: () {
                SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
                setState(() {
                  _index = 1;
                });
              },
              onPress3: () {
                SystemChrome.setSystemUIOverlayStyle(
                    SystemUiOverlayStyle.light);
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
