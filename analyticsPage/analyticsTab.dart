import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:uptime/analyticsPage/taskPanel.dart';
import 'package:uptime/analyticsPage/todayGoalPanel.dart';
import 'package:uptime/analyticsPage/tomatoCountPanel.dart';
import 'package:uptime/analyticsPage/tomatoPanel.dart';

class AnalyticsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          child: Text(
            "统计",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          padding: EdgeInsets.only(top: 50, left: 20),
        ),
        Expanded(
          child: Center(
            child: Column(
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
