import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uptime/model/providerModel.dart';
import 'package:uptime/model/taskModel.dart';

class TaskEdit extends StatefulWidget {
  TaskEdit({
    @required this.index,
    @required this.callback,
    @required this.newTask,
  });

  //任务索引
  final int index;

  //切换对话框是否显示
  final Function callback;

  //是否是新建任务
  final bool newTask;

  @override
  _TaskEditState createState() => _TaskEditState();
}

class _TaskEditState extends State<TaskEdit> {
  TextEditingController _title = TextEditingController();
  TextEditingController _dailyTarget = TextEditingController();
  TextEditingController _totalTarget = TextEditingController();
  TextEditingController _note = TextEditingController();
  String _notification = "每天";
  String _date = "2020-01-01";
  int _taskCount;

  @override
  void initState() {
    _taskCount =
        Provider.of<ProviderModel>(context, listen: false).taskCount;
    super.initState();
  }

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
              child: SizedBox(
                width: 80,
                child: TextField(
                  autofocus: true,
                  controller: _title,
                  style: TextStyle(color: Colors.black54),
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.grey[600],
                  decoration: InputDecoration(
                    labelText: "任务名",
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
              )),
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
            flex: 10,
            child: Container(
              padding: EdgeInsets.all(5),
              width: double.infinity,
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: TextField(
                maxLines: null,
                controller: _note,
                style: TextStyle(color: Colors.black54),
                keyboardType: TextInputType.multiline,
                cursorColor: Colors.grey[600],
                decoration: InputDecoration(
                  hintText: "说点什么吧！",
                  labelStyle: TextStyle(color: Colors.black54),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          widget.newTask ? newRow() : delRow(),
        ],
      ),
    );
  }

  Row newRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        FlatButton(
          color: Colors.teal,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          onPressed: () async {
            if (widget.index == _taskCount) {
              await _addCount();
            }
            await _saveData();
            widget.callback();
            Provider.of<ProviderModel>(context, listen: false).getDataList();
            Provider.of<ProviderModel>(context, listen: false).getTaskCount();
          },
          child: Icon(
            Icons.save,
            color: Colors.white,
            size: 28,
          ),
        ),
        FlatButton(
          color: Colors.lightBlue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          onPressed: widget.callback,
          child: Icon(
            Icons.keyboard_backspace,
            size: 35,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Row delRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        FlatButton(
          color: Colors.redAccent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          onPressed: () async {
            await _delData();
            await _lessCount();
            widget.callback();
            Provider.of<ProviderModel>(context, listen: false).getDataList();
            Provider.of<ProviderModel>(context, listen: false).getTaskCount();
          },
          child: Icon(
            Icons.delete_forever,
            color: Colors.white,
            size: 30,
          ),
        ),
        FlatButton(
          color: Colors.teal,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          onPressed: () async {
            await _saveData();
            widget.callback();
            Provider.of<ProviderModel>(context, listen: false).getDataList();
            Provider.of<ProviderModel>(context, listen: false).getTaskCount();
          },
          child: Icon(
            Icons.save,
            color: Colors.white,
            size: 28,
          ),
        ),
        FlatButton(
          color: Colors.lightBlue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          onPressed: widget.callback,
          child: Icon(
            Icons.keyboard_backspace,
            size: 35,
            color: Colors.white,
          ),
        ),
      ],
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
    List<String> data = [
      _title.text,
      _dailyTarget.text,
      _totalTarget.text,
      _notification,
      _date.toString().substring(0, 10),
      _note.text
    ];
    TaskModel(
      index: widget.index,
      dataList: data,
    ).saveData();
  }

  _delData() {
    for (int i = widget.index; i < _taskCount; i++) {
      TaskModel(index: i + 1).getData().then((list) {
        TaskModel(index: i, dataList: list).saveData();
      });
    }
  }

  _addCount() {
    TaskModel(taskCount: _taskCount + 1).saveTaskCount();
  }

  _lessCount() {
    TaskModel(taskCount: _taskCount - 1).saveTaskCount();
  }
}
