import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uptime/bottomButton.dart';

class BottomBar extends StatelessWidget {
  BottomBar({
    @required this.onPress1,
    @required this.onPress2,
  });

  final Function onPress1;
  final Function onPress2;

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
                TimeButton(
                  onPress: onPress1,
                ),
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
                AnalysisButton(
                  onPress: onPress2,
                ),
                Positioned(
                  top: 51,
                  child: Text(
                    "任务",
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
