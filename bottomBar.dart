import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bottomButton.dart';

class BottomBar extends StatelessWidget {
  BottomBar({
    @required this.onPress1,
    @required this.onPress2,
    @required this.onPress3,
  });

  final Function onPress1;
  final Function onPress2;
  final Function onPress3;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: SizedBox(
            height: ScreenUtil().setHeight(144),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                TimeButton(
                  onPress: onPress1,
                ),
                Positioned(
                  top: ScreenUtil().setHeight(101),
                  child: Text(
                    "计时",
                    style: TextStyle(color: Colors.orange[300], fontSize: ScreenUtil().setSp(24)),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: ScreenUtil().setHeight(144),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                AnalyticsButton(
                  onPress: onPress2,
                ),
                Positioned(
                  top: ScreenUtil().setHeight(101),
                  child: Text(
                    "统计",
                    style: TextStyle(
                        color: Colors.purpleAccent[100], fontSize: ScreenUtil().setSp(24)),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: ScreenUtil().setHeight(144),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                TaskButton(
                  onPress: onPress3,
                ),
                Positioned(
                  top: ScreenUtil().setHeight(101),
                  child: Text(
                    "任务",
                    style: TextStyle(color: Colors.blue[300], fontSize: ScreenUtil().setSp(24)),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
