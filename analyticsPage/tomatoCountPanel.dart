import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:littledecisive/model/providerModel.dart';
import 'package:provider/provider.dart';

class TomatoCountPanel extends StatefulWidget {
  @override
  _TomatoCountPanelState createState() => _TomatoCountPanelState();
}

class _TomatoCountPanelState extends State<TomatoCountPanel> {
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
        margin: EdgeInsets.only(
            left: ScreenUtil().setWidth(20),
            right: ScreenUtil().setWidth(40),
            bottom: ScreenUtil().setHeight(40),
            top: ScreenUtil().setHeight(40)),
        padding: EdgeInsets.all(ScreenUtil().setWidth(30)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "总计番茄",
              style: TextStyle(color: Colors.black54),
            ),
            Expanded(
              child: Consumer(
                builder: (context, ProviderModel providerModel, _) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      providerModel.tomatoSchedule.toString(),
                      style: TextStyle(
                          color: Colors.black26,
                          fontSize: ScreenUtil().setSp(60)),
                    ),
                    Text(
                      "/",
                      style: TextStyle(
                          color: Colors.black26,
                          fontSize: ScreenUtil().setSp(70)),
                    ),
                    Text(
                      providerModel.tomatoGoal.toString(),
                      style: TextStyle(
                          color: Colors.deepOrange,
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
