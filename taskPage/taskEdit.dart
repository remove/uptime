import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:littledecisive/model/dataModel.dart';
import 'package:littledecisive/model/providerModel.dart';
import 'package:provider/provider.dart';

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
  TextEditingController _note = TextEditingController();
  String _notification = "每天";
  String _date = "2020-01-01";
  String _dailyGoal = "0";
  String _totalGoal = "0";
  String _labelText = "任务名";
  String _hintText = "说点什么吧！";
  int _taskCount;

  @override
  void initState() {
    _taskCount = Provider.of<ProviderModel>(context, listen: false).taskCount;
    _initData();
    super.initState();
  }

  _initData() {
    if (!widget.newTask) {
      setState(() {
        _labelText = Provider.of<ProviderModel>(
          context,
          listen: false,
        ).dataList[widget.index][0];
        _dailyGoal = Provider.of<ProviderModel>(
          context,
          listen: false,
        ).dataList[widget.index][1];
        _totalGoal = Provider.of<ProviderModel>(
          context,
          listen: false,
        ).dataList[widget.index][2];
        _hintText = Provider.of<ProviderModel>(
          context,
          listen: false,
        ).dataList[widget.index][5];
      });
    }
    if (_dailyGoal.startsWith("0")) {
      _dailyGoal = "无限";
    }
    if (_totalGoal.startsWith("0")) {
      _totalGoal = "无限";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: ScreenUtil().setWidth(400),
        maxHeight: ScreenUtil().setHeight(400),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
              height: ScreenUtil().setHeight(100),
              child: SizedBox(
                width: ScreenUtil().setWidth(400),
                child: TextField(
                  controller: _title,
                  style: TextStyle(color: Colors.black54),
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.grey[600],
                  decoration: InputDecoration(
                    labelText: _labelText,
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
            padding: EdgeInsets.only(top: 10),
            child: Row(
              children: <Widget>[
                Icon(Icons.flag, color: Colors.black54, size: ScreenUtil().setSp(60)),
                Text("每天目标",
                    style: TextStyle(color: Colors.black54, fontSize: ScreenUtil().setSp(40))),
                Expanded(child: SizedBox()),
                GestureDetector(
                  onTap: () {
                    _showDailyGoalPicker(context);
                  },
                  child: Row(
                    children: <Widget>[
                      Text(
                        _dailyGoal,
                        style: TextStyle(color: Colors.black54, fontSize: ScreenUtil().setSp(40)),
                      ),
                      Text(
                        " /个",
                        style: TextStyle(color: Colors.black54, fontSize: ScreenUtil().setSp(40)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              children: <Widget>[
                Icon(Icons.timer, color: Colors.black54, size: ScreenUtil().setSp(60)),
                Text("总计目标",
                    style: TextStyle(color: Colors.black54, fontSize: ScreenUtil().setSp(40))),
                Expanded(child: SizedBox()),
                GestureDetector(
                  onTap: () {
                    _showTotalTargetPicker(context);
                  },
                  child: Row(
                    children: <Widget>[
                      Text(
                        _totalGoal,
                        style: TextStyle(color: Colors.black54, fontSize: ScreenUtil().setSp(40)),
                      ),
                      Text(
                        " /个",
                        style: TextStyle(color: Colors.black54, fontSize: ScreenUtil().setSp(40)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              children: <Widget>[
                Icon(Icons.notifications, color: Colors.black54, size: ScreenUtil().setSp(60)),
                Text("重复提醒",
                    style: TextStyle(color: Colors.black54, fontSize: ScreenUtil().setSp(40))),
                Expanded(child: SizedBox()),
                GestureDetector(
                  onTap: () {
                    _showNotificationPicker(context);
                  },
                  child: Text(_notification,
                      style: TextStyle(color: Colors.black54, fontSize: ScreenUtil().setSp(40))),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              children: <Widget>[
                Icon(Icons.date_range, color: Colors.black54, size: ScreenUtil().setSp(60)),
                Text("结束日期",
                    style: TextStyle(color: Colors.black54, fontSize: ScreenUtil().setSp(40))),
                Expanded(child: SizedBox()),
                GestureDetector(
                  onTap: () {
                    _showDatePicker(context);
                  },
                  child: Text(_date.toString().substring(0, 10),
                      style: TextStyle(color: Colors.black54, fontSize: ScreenUtil().setSp(40))),
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
                  hintText: _hintText,
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
          onPressed: _new,
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
          onPressed: _del,
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
          onPressed: _edit,
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

  _new() async {
    await _saveData();
    await DataModel().saveScheduleList(widget.index, ["0", "0"]);
    await DataModel().saveTask(_title.text);
    await DataModel().saveTaskCount(_taskCount + 1);
    widget.callback();
    _flashProvider();
  }

  _edit() async {
    await _saveData();
    await DataModel().editTask(widget.index, _title.text);
    widget.callback();
    _flashProvider();
  }

  _del() async {
    await _delData();
    await _delScheduleList();
    await DataModel().delTask(widget.index);
    await DataModel().saveTaskCount(_taskCount - 1);
    widget.callback();
    _flashProvider();
  }

  _saveData() {
    if (_title.text.isEmpty) {
      _title.text = "未命名";
    }
    if (_dailyGoal.contains("无限")) {
      _dailyGoal = "0";
    }
    if (_totalGoal.contains("无限")) {
      _totalGoal = "0";
    }
    List<String> data = [
      _title.text,
      _dailyGoal,
      _totalGoal,
      _notification,
      _date.toString().substring(0, 10),
      _note.text
    ];
    DataModel().saveData(data, widget.index);
  }

  _delData() {
    for (int i = widget.index; i < _taskCount; i++) {
      DataModel().getData(i + 1).then((list) {
        DataModel().saveData(list, i);
      });
    }
  }

  _delScheduleList() {
    for (int i = widget.index; i < _taskCount; i++) {
      DataModel().getScheduleList(i + 1).then((list) {
        DataModel().saveScheduleList(i, list);
      });
    }
  }

  _flashProvider() {
    Provider.of<ProviderModel>(context, listen: false).getDataList();
    Provider.of<ProviderModel>(context, listen: false).getScheduleList();
    Provider.of<ProviderModel>(context, listen: false).getTaskCount();
    Provider.of<ProviderModel>(context, listen: false).getTaskList();
  }

  _showDailyGoalPicker(BuildContext context) {
    List<int> list = List.generate(50, (index) {
      return index;
    });
    final picker = CupertinoPicker(
      itemExtent: 28,
      onSelectedItemChanged: (index) {
        if (index == 0) {
          setState(() {
            _dailyGoal = "无限";
          });
          return;
        }
        setState(() {
          _dailyGoal = list[index].toString();
        });
      },
      children: list.map((e) {
        if (e == 0) {
          return Text("无限");
        }
        return Text(e.toString());
      }).toList(),
    );
    showCupertinoModalPopup(
      context: context,
      builder: (cxt) {
        return Container(
          height: 300,
          child: picker,
        );
      },
    );
  }

  _showTotalTargetPicker(BuildContext context) {
    List<int> list = List.generate(1000, (index) {
      return index;
    });
    final picker = CupertinoPicker(
      itemExtent: 28,
      onSelectedItemChanged: (index) {
        if (index == 0) {
          setState(() {
            _totalGoal = "无限";
          });
          return;
        }
        setState(() {
          _totalGoal = list[index].toString();
        });
      },
      children: list.map((e) {
        if (e == 0) {
          return Text("无限");
        }
        return Text(e.toString());
      }).toList(),
    );
    showCupertinoModalPopup(
      context: context,
      builder: (cxt) {
        return Container(
          height: 300,
          child: picker,
        );
      },
    );
  }

  _showNotificationPicker(BuildContext context) {
    var names = ['每天', '从不'];
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
}
