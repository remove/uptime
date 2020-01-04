import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uptime/timecount.dart';

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> with WidgetsBindingObserver {
  double _radius = 13.0;
  double _offsetX = 3.0;
  double _offsetY = 5.0;
  double _boxHeight = 250.0;
  double _boxWidth = 250.0;
  Color _color1 = Colors.yellow[700];
  Color _color2 = Colors.deepOrange;
  Color _shadowC = Colors.deepOrange[500];
  bool _play = false;
  bool _relaxTime = false;
  static GlobalKey<TimeCountState> _globalKey = GlobalKey();

  //启动动画
  void _startAnimated() {
    setState(() {
      _color1 = Colors.orangeAccent;
      _color2 = Colors.red;
      _shadowC = Colors.red;
      _boxWidth = 330;
      _boxHeight = 330;
    });
  }

  void _relaxAnimated() {
    setState(() {
      _color1 = Colors.cyanAccent;
      _color2 = Colors.cyan;
      _shadowC = Colors.cyan[300];
    });
  }

  void _cancelAnimated() {
    if (_relaxTime) {
      setState(() {
        _color1 = Colors.orangeAccent;
        _color2 = Colors.red;
        _shadowC = Colors.red;
        _relaxTime = false;
      });
      return;
    }
    setState(() {
      _color1 = Colors.yellow[700];
      _color2 = Colors.deepOrange;
      _shadowC = Colors.deepOrange[500];
      _boxWidth = 250;
      _boxHeight = 250;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    final Brightness brightness =
        WidgetsBinding.instance.window.platformBrightness;
    setState(() {
      if (brightness == Brightness.dark) {
        setState(() {
          _radius = 60;
          _offsetX = 0;
          _offsetY = 0;
        });
      } else if (brightness == Brightness.light) {
        setState(() {
          _radius = 13;
          _offsetX = 3;
          _offsetY = 5;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<TimeCountNotification>(
      onNotification: (onNotification) {
        if (onNotification.signal) {
          _relaxAnimated();
          _relaxTime = true;
          return false;
        }
        _startAnimated();
        _relaxTime = false;
        return false;
      },
      child: GestureDetector(
        //判断是否计时状态
        onTap: () {
          if (!_play) {
            //开始计时
            _globalKey.currentState.startTime();
            _startAnimated();
            _play = true;
          }
        },
        onLongPress: () {
          //取消计时
          _globalKey.currentState.cancelTime();
          _cancelAnimated();
          _play = false;
        },
        child: AnimatedContainer(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(300)),
            gradient: RadialGradient(
              colors: [_color1, _color2],
              center: Alignment.topLeft,
              radius: 1.1,
            ),
            boxShadow: [
              BoxShadow(
                color: _shadowC,
                blurRadius: _radius,
                offset: Offset(_offsetX, _offsetY),
              )
            ],
          ),
          duration: Duration(milliseconds: 1000),
          curve: Curves.elasticOut,
          height: _boxHeight,
          width: _boxWidth,
          child: TimeCount(
            key: _globalKey,
          ),
        ),
      ),
    );
  }
}
