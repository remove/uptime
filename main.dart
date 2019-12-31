import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      initialRoute: "/",
      routes: {
        "/": (context) => AppHome(),
      },
    );
  }
}

class AppHome extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<AppHome> {
  final double _top = 50;
  Timer _timer;
  int _count;
  bool _relaxTimeState = false;
  bool _visible = false;
  bool _play = false;
  bool _pause = false;
  int _workTimeCount = 1500;
  int _relaxTimeCount = 300;
  double _boxHeight = 250;
  double _boxWidth = 250;
  String _note = "长按结束";
  Color _color1 = Colors.orange[300];
  Color _color2 = Colors.deepOrange;
  Color _shadowC = Colors.deepOrange[500];

  //计时器
  void _timerCount() {
    if (!_relaxTimeState) {
      _timer = Timer.periodic(
        Duration(seconds: 1),
        (Timer timer) {
          if (_count == 0) {
            _timer.cancel();
            _relaxTime();
            return;
          }
          setState(() {
            _count--;
          });
        },
      );
      return;
    } else if (_relaxTimeState) {
      _timer = Timer.periodic(
        Duration(seconds: 1),
        (Timer timer) {
          if (_count == 0) {
            _resetRelaxTime();
            _startTime();
            return;
          }
          setState(() {
            _count--;
          });
        },
      );
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
  void _startTime() {
    Future.delayed(Duration(milliseconds: 1), () {
      _timerCount();
    });
    setState(() {
      _count = _workTimeCount;
      _visible = true;
      _play = true;
      _boxWidth = 330;
      _boxHeight = 330;
      _color1 = Colors.orange;
      _color2 = Colors.red;
      _shadowC = Colors.deepOrange[500];
    });
  }

  //休息状态设置
  void _relaxTime() {
    setState(() {
      _color1 = Colors.lightGreenAccent;
      _color2 = Colors.green;
      _shadowC = Colors.green;
      _relaxTimeState = true;
      _count = _relaxTimeCount;
      _note = "长按跳过";
    });
    _timerCount();
  }

  //重设休息后状态
  void _resetRelaxTime() {
    _timer.cancel();
    _relaxTimeState = false;
    _note = "长按结束";
  }

  //取消状态设置
  void _cancelTime() {
    if (_relaxTimeState) {
      _resetRelaxTime();
      _startTime();
      return;
    }
    _timer.cancel();
    _visible = false;
    _relaxTimeState = false;
    setState(() {
      _count = _workTimeCount;
      _play = false;
      _color1 = Colors.orange[300];
      _color2 = Colors.deepOrange;
      _shadowC = Colors.deepOrange[500];
    });
    _boxWidth = 250;
    _boxHeight = 250;
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
    return CupertinoPageScaffold(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(top: _top),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20, top: 5),
                child: Text(
                  "番茄钟",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  //判断是否计时状态
                  onTap: () {
                    if (!_play) {
                      //开始计时
                      _startTime();
                    }
                  },
                  onLongPress: () {
                    //取消计时
                    _cancelTime();
                  },
                  child: AnimatedContainer(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(300)),
                      gradient: RadialGradient(
                        colors: [_color1, _color2],
                        center: Alignment.topLeft,
                        radius: 1.3,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: _shadowC,
                          blurRadius: 12,
                          offset: Offset(2, 5),
                        )
                      ],
                    ),
                    duration: Duration(milliseconds: 1000),
                    curve: Curves.elasticOut,
                    height: _boxHeight,
                    width: _boxWidth,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          AnimatedPadding(
                            padding: EdgeInsets.only(top: 105),
                            duration: Duration(milliseconds: 500),
                            child: Text(
                              _transSecond(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 35),
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
