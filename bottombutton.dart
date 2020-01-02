import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimeButton extends StatefulWidget {
  @override
  _TimeButtonState createState() => _TimeButtonState();
}

class _TimeButtonState extends State<TimeButton> {
  double _shadow = 3;
  double _radius = 8;
  double _light = 1;
  double _offset = 0;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _shadow = 0;
      _radius = 0;
      _light = 0;
      _offset = 2;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _shadow = 3;
      _radius = 8;
      _light = 1;
      _offset = 0;
    });
  }

  void _onTapCancel() {
    setState(() {
      _shadow = 3;
      _radius = 8;
      _light = 1;
      _offset = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTapDown: _onTapDown,
          onTapUp: _onTapUp,
          onTapCancel: _onTapCancel,
          child: AnimatedContainer(
            margin: EdgeInsets.only(top: _offset, left: _offset),
            duration: Duration(milliseconds: 50),
            constraints: BoxConstraints(maxHeight: 50, maxWidth: 50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                  color: Colors.orange[300],
                  blurRadius: _radius,
                  offset: Offset(_shadow, _shadow),
                ),
              ],
              gradient: RadialGradient(
                  colors: [Colors.yellow, Colors.orange[400]],
                  center: Alignment.topLeft,
                  radius: _light),
            ),
            child: Center(
              child: Icon(
                Icons.timer,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AnalysisButton extends StatefulWidget {
  @override
  _AnalysisButtonState createState() => _AnalysisButtonState();
}

class _AnalysisButtonState extends State<AnalysisButton> {
  double _shadow = 3;
  double _radius = 8;
  double _light = 1;
  double _offset = 0;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _shadow = 0;
      _radius = 0;
      _light = 0;
      _offset = 2;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _shadow = 3;
      _radius = 8;
      _light = 1;
      _offset = 0;
    });
  }

  void _onTapCancel() {
    setState(() {
      _shadow = 3;
      _radius = 8;
      _light = 1;
      _offset = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTapDown: _onTapDown,
          onTapUp: _onTapUp,
          onTapCancel: _onTapCancel,
          child: AnimatedContainer(
            margin: EdgeInsets.only(top: _offset, left: _offset),
            duration: Duration(milliseconds: 50),
            constraints: BoxConstraints(maxHeight: 50, maxWidth: 50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue[300],
                  blurRadius: _radius,
                  offset: Offset(_shadow, _shadow),
                ),
              ],
              gradient: RadialGradient(
                  colors: [Colors.lightBlueAccent[100], Colors.blue[400]],
                  center: Alignment.topLeft,
                  radius: _light),
            ),
            child: Center(
              child: Icon(
                Icons.assessment,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
