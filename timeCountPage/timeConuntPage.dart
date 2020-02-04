import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ball.dart';

class TimeCountPage extends StatefulWidget {
  @override
  _TimeCountPageState createState() => _TimeCountPageState();
}

class _TimeCountPageState extends State<TimeCountPage> {
  String _choice = "选择任务";

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            child: Text(
              "Aero",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            padding: EdgeInsets.only(top: 50, left: 20),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Ball(),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: FlatButton(
                      color: Colors.black12,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      onPressed: () {
                        _showNotificationPicker(context);
                      },
                      child: Text(
                        "$_choice",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _showNotificationPicker(BuildContext context) {
    var names = ['', '学习', '运动','阅读'];
    final picker = CupertinoPicker(
      itemExtent: 30,
      onSelectedItemChanged: (position) {
        setState(() {
          _choice = names[position];
        });
      },
      children: names.map((e) {
        return Text(e);
      }).toList(),
    );
    showCupertinoModalPopup(
      context: context,
      builder: (cxt) {
        return Container(
          height: 200,
          child: picker,
        );
      },
    );
  }
}
