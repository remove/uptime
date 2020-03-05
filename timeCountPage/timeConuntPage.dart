import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uptime/model/providerModel.dart';

import 'ball.dart';

class TimeCountPage extends StatefulWidget {
  @override
  _TimeCountPageState createState() => _TimeCountPageState();
}

class _TimeCountPageState extends State<TimeCountPage> {
  int _taskIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    child: Consumer(
                      builder: (context, ProviderModel providerModel, _) =>
                          Text(
                        providerModel.taskList[_taskIndex],
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _showNotificationPicker(BuildContext context) {
    final picker = Consumer(
      builder: (context, ProviderModel providerModel, _) => CupertinoPicker(
        itemExtent: 30,
        onSelectedItemChanged: (index) {
          setState(() {
            _taskIndex = index;
          });
          Provider.of<ProviderModel>(context, listen: false)
              .setTimingTask(index - 1);
        },
        children: providerModel.taskList.map((e) {
          return Text(e);
        }).toList(),
      ),
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
