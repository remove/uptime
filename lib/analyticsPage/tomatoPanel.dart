import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:uptime/model/providerModel.dart';

import 'tomatoBar.dart';

class TomatoPanel extends StatefulWidget {
  @override
  _TomatoPanelState createState() => _TomatoPanelState();
}

class _TomatoPanelState extends State<TomatoPanel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          ScreenUtil().setWidth(40),
          ScreenUtil().setHeight(40),
          ScreenUtil().setWidth(40),
          ScreenUtil().setHeight(40)),
      padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(30),
          left: ScreenUtil().setWidth(40),
          right: ScreenUtil().setWidth(40)),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black12, offset: Offset(0, 20), blurRadius: 30)
        ],
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      constraints: BoxConstraints(
          maxHeight: ScreenUtil().setHeight(400), minWidth: double.infinity),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            top: 0,
            child: Text("番茄数/天"),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Text(
              "最近七天",
              style: TextStyle(color: Colors.black45),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Consumer(
              builder: (context, ProviderModel providerModel, _) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TomatoBar(
                      height: int.parse(providerModel.tomatoAnalysisList[6])),
                  TomatoBar(
                      height: int.parse(providerModel.tomatoAnalysisList[5])),
                  TomatoBar(
                      height: int.parse(providerModel.tomatoAnalysisList[4])),
                  TomatoBar(
                      height: int.parse(providerModel.tomatoAnalysisList[3])),
                  TomatoBar(
                      height: int.parse(providerModel.tomatoAnalysisList[2])),
                  TomatoBar(
                      height: int.parse(providerModel.tomatoAnalysisList[1])),
                  TomatoBar(
                      height: int.parse(providerModel.tomatoAnalysisList[0])),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
