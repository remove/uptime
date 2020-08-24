import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:uptime/model/providerModel.dart';

import 'editDetailContainer.dart';
import 'listContainer.dart';
import 'newTask.dart';

class TaskTabRoute extends StatefulWidget {
  @override
  _TaskTabRouteState createState() => _TaskTabRouteState();
}

class _TaskTabRouteState extends State<TaskTabRoute> {
  bool _detailVisible = false;
  bool _newTask = false;
  int _index;

  //选择时显示详细
  void onChangeVisible(int index, bool newTask) {
    setState(() {
      _index = index;
      _detailVisible = !_detailVisible;
      _newTask = newTask;
    });
  }

  //隐藏详细
  void hideDetailVisible() {
    setState(() {
      _detailVisible = !_detailVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight(1400),
              constraints: BoxConstraints(minWidth: double.infinity),
              padding: EdgeInsets.fromLTRB(7, 0, 7, 0),
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [Colors.purpleAccent[100], Colors.blue],
                  center: Alignment.topCenter,
                  radius: 2,
                ),
                borderRadius: BorderRadius.all(Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.blue[300],
                      blurRadius: 20,
                      offset: Offset(0, 10))
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil.statusBarHeight,
                        left: ScreenUtil().setWidth(20)),
                    child: Text(
                      "任务",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(70),
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(1180),
                    width: double.infinity,
                    child: taskList(),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          child: _detailVisible
              ? EditDetailContainer(
                  newTask: _newTask,
                  callback: hideDetailVisible,
                  index: _index,
                )
              : SizedBox(),
        ),
      ],
    );
  }

  Consumer<ProviderModel> taskList() {
    return Consumer(
      builder: (context, ProviderModel providerModel, _) => GridView.builder(
        itemCount: providerModel.taskCount + 1,
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.9),
        itemBuilder: (context, index) {
          if (index < providerModel.taskCount) {
            return ListContainer(
              index: index,
              callback: onChangeVisible,
            );
          } else {
            return NewTask(
              callback: onChangeVisible,
            );
          }
        },
      ),
    );
  }
}
