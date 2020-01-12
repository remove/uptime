import 'package:flutter/material.dart';

import 'ball.dart';

class TimeCountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              child: Ball(),
            ),
          )
        ],
      ),
    );
  }
}
