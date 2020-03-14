import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          padding: EdgeInsets.only(top: 50, left: 20),
        ),
        Expanded(
          child: Center(
            child: ListView(
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
