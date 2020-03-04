import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uptime/analyticsPage/taskBar.dart';
import 'package:uptime/model/providerModel.dart';

class TaskPanel extends StatefulWidget {
  @override
  _TaskPanelState createState() => _TaskPanelState();
}

class _TaskPanelState extends State<TaskPanel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.only(top: 15, left: 20, right: 20),
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
      constraints: BoxConstraints(maxHeight: 200, minWidth: double.infinity),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            top: 0,
            child: Text("任务完成数/天"),
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
                  TaskBar(height: int.parse(providerModel.taskAnalysisList[6])),
                  TaskBar(height: int.parse(providerModel.taskAnalysisList[5])),
                  TaskBar(height: int.parse(providerModel.taskAnalysisList[4])),
                  TaskBar(height: int.parse(providerModel.taskAnalysisList[3])),
                  TaskBar(height: int.parse(providerModel.taskAnalysisList[2])),
                  TaskBar(height: int.parse(providerModel.taskAnalysisList[1])),
                  TaskBar(height: int.parse(providerModel.taskAnalysisList[0])),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
