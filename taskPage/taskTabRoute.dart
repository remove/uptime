import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uptime/taskPage/editDetailContainer.dart';
import 'package:uptime/taskPage/listContainer.dart';
import 'package:uptime/taskPage/newTask.dart';
import 'package:uptime/model/taskModel.dart';

class TaskTabRoute extends StatefulWidget {
  @override
  _TaskTabRouteState createState() => _TaskTabRouteState();
}

class _TaskTabRouteState extends State<TaskTabRoute> {
  bool _detailVisible = false;
  bool _newTask = false;
  int _index;
  int _taskCount = -1;

  @override
  void initState() {
    TaskModel().getTaskCount().then((data) {
      setState(() {
        _taskCount = data;
      });
    });
    super.initState();
  }

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

  void refreshTab() {
    TaskModel().getTaskCount().then((data) {
      setState(() {
        _taskCount = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Expanded(
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                constraints:
                    BoxConstraints(minHeight: 720, minWidth: double.infinity),
                padding: EdgeInsets.all(7),
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
                      padding: EdgeInsets.only(top: 40, left: 10),
                      child: Text(
                        "任务",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 300,
                      width: double.infinity,
                      child: GridView.builder(
                        itemCount: _taskCount + 1,
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.9,
                        ),
                        itemBuilder: (context, index) {
                          if (index < _taskCount) {
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
                    refresh: refreshTab,
                    index: _index,
                  )
                : SizedBox(),
          ),
        ],
      ),
    );
  }
}
