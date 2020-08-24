import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:uptime/model/providerModel.dart';

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
          minHeight: ScreenUtil().setHeight(200),
          maxHeight: ScreenUtil().setHeight(200),
        ),
        padding: EdgeInsets.all(ScreenUtil().setWidth(30)),
        margin: EdgeInsets.only(
            left: ScreenUtil().setWidth(40),
            right: ScreenUtil().setWidth(20),
            bottom: ScreenUtil().setHeight(40),
            top: ScreenUtil().setHeight(40)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "今天目标",
              style: TextStyle(color: Colors.black54),
            ),
            Expanded(
              child: Consumer(
                builder: (context, ProviderModel providerModel, _) =>
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          providerModel.todayGoalSchedule.toString(),
                          style: TextStyle(color: Colors.black26,
                              fontSize: ScreenUtil().setSp(60)),
                        ),
                        Text(
                          "/",
                          style: TextStyle(color: Colors.black26,
                              fontSize: ScreenUtil().setSp(70)),
                        ),
                        Text(
                          providerModel.todayGoal.toString(),
                          style: TextStyle(color: Colors.blue,
                              fontSize: ScreenUtil().setSp(70)),
                        ),
                      ],
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
