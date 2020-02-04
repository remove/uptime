import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimeCount extends StatefulWidget {
  TimeCount({Key key}) : super(key: key);

  @override
  TimeCountState createState() => TimeCountState();
}

class TimeCountState extends State<TimeCount> {
  DateTime lastPopTime;
  Timer _timer;
  int _count;
  bool _relaxTimeState = false;
  bool _visible = false;
  bool _pause = false;
  int _workTimeCount = 1500;
  int _relaxTimeCount = 300;

  String _note = "长按结束";

  //计时器
  void _timerCount() {
    //休息状态
    if (_relaxTimeState) {
      _timer = Timer.periodic(
        Duration(seconds: 1),
        (Timer timer) {
          if (_count == 0) {
            _timer.cancel();
            //重置为工作状态
            _resetToWorkTime();
            //发送消息
            TimeCountNotification(signal: false).dispatch(context);
            return;
          }
          setState(() {
            _count--;
          });
        },
      );
      //工作状态
    } else if (!_relaxTimeState) {
      _timer = Timer.periodic(
        Duration(seconds: 1),
        (Timer timer) {
          if (_count == 0) {
            _timer.cancel();
            //进入休息状态
            _relaxTime();
            //发送消息
            TimeCountNotification(signal: true).dispatch(context);
            return;
          }
          setState(() {
            _count--;
          });
        },
      );
      return;
    }
  }

  //分秒换算
  String _transSecond() {
    int minute = _count ~/ 60;
    int seconds = _count % 60;
    if (_count % 60 == 0) {
      return ("$minute:$seconds\0");
    } else if (_count % 60 <= 9 && _count > 0) {
      return ("$minute:0$seconds");
    }
    return ("$minute:$seconds");
  }

  //启动状态设置
  void startTime() {
    setState(() {
      _visible = true;
    });
    _timerCount();
  }

  //休息状态设置
  void _relaxTime() {
    setState(() {
      _relaxTimeState = true;
      _count = _relaxTimeCount;
      _note = "长按跳过";
    });
    _timerCount();
  }

  //重设为工作状态
  void _resetToWorkTime() {
    _count = _workTimeCount;
    _relaxTimeState = false;
    _note = "长按结束";
    _pause = false;
    _timerCount();
  }

  //取消状态设置
  void cancelTime() {
    if (_relaxTimeState) {
      _timer.cancel();
      _resetToWorkTime();
      return;
    }
    _timer.cancel();
    setState(() {
      _visible = false;
      _relaxTimeState = false;
      _pause = false;
      _count = _workTimeCount;
    });
  }

  //暂停
  void _pauseTime() {
    if (!_pause) {
      _timer.cancel();
      setState(() {
        _pause = true;
      });
      return;
    }
    _timerCount();
    setState(() {
      _pause = false;
    });
  }

  @override
  void initState() {
    _count = _workTimeCount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AnimatedPadding(
            padding: EdgeInsets.only(top: 105),
            duration: Duration(milliseconds: 500),
            child: Text(
              _transSecond(),
              style: TextStyle(color: Colors.white, fontSize: 35),
            ),
          ),
          Visibility(
            visible: _visible,
            child: CupertinoButton(
              child: Icon(
                _pause ? Icons.play_arrow : Icons.pause,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                _pauseTime();
              },
            ),
          ),
          Visibility(
            visible: _visible,
            child: Text(
              _note,
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          )
        ],
      ),
    );
  }
}

class TimeCountNotification extends Notification {
  TimeCountNotification({this.signal});

  final bool signal;
}