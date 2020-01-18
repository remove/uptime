import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uptime/detailContainer.dart';
import 'package:uptime/listContainer.dart';
import 'package:uptime/newTask.dart';

class TaskTabRoute extends StatefulWidget {
  @override
  _TaskTabRouteState createState() => _TaskTabRouteState();
}

class _TaskTabRouteState extends State<TaskTabRoute> {
  bool _detailVisible = false;
  int _index;

  void onChangeVisible(int index) {
    setState(() {
      _index = index;
      _detailVisible = !_detailVisible;
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
                    BoxConstraints(minHeight: 750, minWidth: double.infinity),
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
                      height: MediaQuery.of(context).size.height - 270,
                      width: double.infinity,
                      child: GridView.builder(
                        itemCount: 4,
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.9,
                        ),
                        itemBuilder: (context, index) {
                          if (index <= 2) {
                            return ListContainer(
                              index: index,
                              callback: onChangeVisible,
                            );
                          } else{
                            return NewTask();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Center(
            child: _detailVisible
                ? DetailContainer(
                    index: _index,
                  )
                : SizedBox(),
          )
        ],
      ),
    );
  }
}
