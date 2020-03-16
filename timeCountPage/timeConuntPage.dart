import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:littledecisive/model/providerModel.dart';
import 'package:provider/provider.dart';

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
            "计时",
            style: TextStyle(fontSize: ScreenUtil().setSp(70), fontWeight: FontWeight.bold),
          ),
          padding: EdgeInsets.only(top: ScreenUtil.statusBarHeight, left: ScreenUtil().setWidth(40)),
        ),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Ball(),
                Padding(
                  padding: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
                  child: FlatButton(
                    color: Colors.black12,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {
                      _showNotificationPicker(context);
                    },
                    child: Consumer(
                      builder: (context, ProviderModel providerModel, _) =>
                          choice(providerModel),
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

  Widget choice(ProviderModel data) {
    if (_taskIndex > data.taskCount) {
      return Text(
        data.taskList[0],
        style: TextStyle(color: Colors.black54),
      );
    }
    return Text(
      data.taskList[_taskIndex],
      style: TextStyle(color: Colors.black54),
    );
  }

  _showNotificationPicker(BuildContext context) {
    final picker = CupertinoPicker(
      itemExtent: 30,
      onSelectedItemChanged: (index) {
        setState(() {
          _taskIndex = index;
        });
        Provider.of<ProviderModel>(context, listen: false)
            .setTimingTask(index - 1);
      },
      children:
          Provider.of<ProviderModel>(context, listen: false).taskList.map((e) {
        return Text(e);
      }).toList(),
    );
    showCupertinoModalPopup(
      context: context,
      builder: (cxt) {
        return Container(
          height: ScreenUtil().setHeight(400),
          child: picker,
        );
      },
    );
  }
}
