import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uptime/bottombutton.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
          child: SizedBox(
            height: 72,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                TimeButton(),
                Positioned(
                  top: 51,
                  child: Text(
                    "计时",
                    style: TextStyle(color: Colors.orange[300], fontSize: 12),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 72,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                AnalysisButton(),
                Positioned(
                  top: 51,
                  child: Text(
                    "统计",
                    style: TextStyle(color: Colors.blue[300], fontSize: 12),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
