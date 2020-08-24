import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'taskPanel.dart';
import 'todayGoalPanel.dart';
import 'tomatoCountPanel.dart';
import 'tomatoPanel.dart';

class AnalyticsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          child: Text(
            "统计",
            style: TextStyle(fontSize: ScreenUtil().setSp(70), fontWeight: FontWeight.bold),
          ),
          padding: EdgeInsets.only(top: ScreenUtil.statusBarHeight, left: ScreenUtil().setWidth(40)),
        ),
        Expanded(
          child: Center(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    TodayGoalPanel(),
                    TomatoCountPanel(),
                  ],
                ),
                TomatoPanel(),
                TaskPanel(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
