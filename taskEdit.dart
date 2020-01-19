import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uptime/taskModel.dart';

class TaskEdit extends StatefulWidget {
  TaskEdit({
    @required this.index,
  });

  final int index;

  @override
  _TaskEditState createState() => _TaskEditState();
}

class _TaskEditState extends State<TaskEdit> {
  TextEditingController _dailyTarget = TextEditingController();
  TextEditingController _totalTarget = TextEditingController();
  String _notification = "每天";
  String _date = "2020-01-01";

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 200,
        maxHeight: 200,
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
            child: Text("标题",
                style: TextStyle(fontSize: 30, color: Colors.black54)),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Icon(Icons.flag, color: Colors.black54, size: 30),
                Text("每天目标",
                    style: TextStyle(color: Colors.black54, fontSize: 20)),
                Expanded(child: SizedBox()),
                SizedBox(
                  width: 58,
                  height: 35,
                  child: TextField(
                    controller: _dailyTarget,
                    style: TextStyle(color: Colors.black54),
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.grey[600],
                    decoration: InputDecoration(
                      labelText: "个数",
                      labelStyle: TextStyle(color: Colors.black54),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black54,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              children: <Widget>[
                Icon(Icons.timer, color: Colors.black54, size: 30),
                Text("总计目标",
                    style: TextStyle(color: Colors.black54, fontSize: 20)),
                Expanded(child: SizedBox()),
                SizedBox(
                  height: 35,
                  width: 58,
                  child: TextField(
                    controller: _totalTarget,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black54,
                    decoration: InputDecoration(
                      labelText: "个数",
                      labelStyle: TextStyle(color: Colors.black54),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black54,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              children: <Widget>[
                Icon(Icons.notifications, color: Colors.black54, size: 30),
                Text("重复提醒",
                    style: TextStyle(color: Colors.black54, fontSize: 20)),
                Expanded(child: SizedBox()),
                GestureDetector(
                  onTap: () {
                    _showNotificationPicker(context);
                  },
                  child: Text(_notification,
                      style: TextStyle(color: Colors.black54, fontSize: 20)),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              children: <Widget>[
                Icon(Icons.date_range, color: Colors.black54, size: 30),
                Text("结束日期",
                    style: TextStyle(color: Colors.black54, fontSize: 20)),
                Expanded(child: SizedBox()),
                GestureDetector(
                  onTap: () {
                    _showDatePicker(context);
                  },
                  child: Text(_date.toString().substring(0, 10),
                      style: TextStyle(color: Colors.black54, fontSize: 20)),
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlatButton(
                color: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: _delData,
                child: Icon(
                  Icons.delete_forever,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              FlatButton(
                color: Colors.teal,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {
                  _saveData();
                },
                child: Icon(
                  Icons.save,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              FlatButton(
                color: Colors.lightBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {},
                child: Icon(
                  Icons.keyboard_backspace,
                  size: 35,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _showNotificationPicker(BuildContext context) {
    var names = ['', '每天', '从不'];
    final picker = CupertinoPicker(
      itemExtent: 30,
      onSelectedItemChanged: (position) {
        setState(() {
          _notification = names[position];
        });
      },
      children: names.map((e) {
        return Text(e);
      }).toList(),
    );
    showCupertinoModalPopup(
      context: context,
      builder: (cxt) {
        return Container(
          height: 200,
          child: picker,
        );
      },
    );
  }

  _showDatePicker(BuildContext context) {
    final picker = CupertinoDatePicker(
      onDateTimeChanged: (date) {
        setState(() {
          _date = date.toString();
        });
      },
      initialDateTime: DateTime.now(),
    );
    showCupertinoModalPopup(
      context: context,
      builder: (cxt) {
        return Container(
          height: 200,
          child: picker,
        );
      },
    );
  }

  _saveData() {
    return TaskModel(
            index: widget.index,
            title: "学习",
            flag: _dailyTarget.text,
            done: _totalTarget.text,
            notification: _notification,
            endDate: _date.toString().substring(0,10),
            note: "好好学习！")
        .saveData();
  }

  _delData(){
    return TaskModel(index: widget.index).delData();
  }
}
