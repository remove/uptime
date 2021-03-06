import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskBar extends StatelessWidget {
  TaskBar({
    @required this.height,
  });

  final int height;

  @override
  Widget build(BuildContext context) {
    return bar();
  }

  Widget bar() {
    if (height > 0) {
      return Container(
        width: ScreenUtil().setWidth(60),
        height: ScreenUtil().setHeight(height * ScreenUtil().setHeight(120)),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        constraints: BoxConstraints(
          maxHeight: ScreenUtil().setHeight(320),
          minHeight: ScreenUtil().setHeight(60),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(14)),
              child: Text(
                height.toInt().toString(),
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            )
          ],
        ),
      );
    }
    return Container(
      width: ScreenUtil().setWidth(60),
      height: ScreenUtil().setHeight(10),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    );
  }
}
