import 'package:flutter/material.dart';

class TodayGoalPanel extends StatefulWidget {
  @override
  _TodayGoalPanelState createState() => _TodayGoalPanelState();
}

class _TodayGoalPanelState extends State<TodayGoalPanel> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 10),
              blurRadius: 40,
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        constraints: BoxConstraints(
          minHeight: 100,
          maxHeight: 100,
        ),
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(left: 20, right: 10, bottom: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "今天目标",
              style: TextStyle(color: Colors.black54),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "2",
                    style: TextStyle(color: Colors.black26, fontSize: 30),
                  ),
                  Text(
                    "/",
                    style: TextStyle(color: Colors.black26, fontSize: 35),
                  ),
                  Text(
                    "10",
                    style: TextStyle(color: Colors.blue, fontSize: 35),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
