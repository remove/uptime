import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimeButton extends StatefulWidget {
  TimeButton({@required this.onPress});

  final Function onPress;

  @override
  _TimeButtonState createState() => _TimeButtonState();
}

class _TimeButtonState extends State<TimeButton> with WidgetsBindingObserver {
  double _shadow = 3;
  double _radius = 8;
  double _light = 1;
  double _offset = 0;
  bool _dark = false;

  void _onTapDown(TapDownDetails details) {
    if (_dark) {
      setState(() {
        _radius = 0;
        _light = 0;
      });
    } else {
      setState(() {
        _shadow = 0;
        _radius = 0;
        _light = 0;
        _offset = 2;
      });
    }
  }

  void _onTapUp(TapUpDetails details) {
    if (_dark) {
      setState(() {
        _radius = 30;
        _light = 1;
      });
    } else {
      setState(() {
        _shadow = 3;
        _radius = 8;
        _light = 1;
        _offset = 0;
      });
    }
  }

  void _onTapCancel() {
    if (_dark) {
      setState(() {
        _radius = 30;
        _light = 1;
      });
    } else {
      setState(() {
        _shadow = 3;
        _radius = 8;
        _light = 1;
        _offset = 0;
      });
    }
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
        _dark = true;
        setState(() {
          _shadow = 0;
          _radius = 30;
          _light = 1;
          _offset = 0;
        });
      } else if (brightness == Brightness.light) {
        _dark = false;
        setState(() {
          _shadow = 3;
          _radius = 8;
          _light = 1;
          _offset = 0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: widget.onPress,
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
  AnalysisButton({@required this.onPress});

  final Function onPress;

  @override
  _AnalysisButtonState createState() => _AnalysisButtonState();
}

class _AnalysisButtonState extends State<AnalysisButton>
    with WidgetsBindingObserver {
  double _shadow = 3;
  double _radius = 8;
  double _light = 1;
  double _offset = 0;
  bool _dark = false;

  void _onTapDown(TapDownDetails details) {
    if (_dark) {
      setState(() {
        _radius = 0;
        _light = 0;
      });
    } else {
      setState(() {
        _shadow = 0;
        _radius = 0;
        _light = 0;
        _offset = 2;
      });
    }
  }

  void _onTapUp(TapUpDetails details) {
    if (_dark) {
      setState(() {
        _radius = 30;
        _light = 1;
      });
    } else {
      setState(() {
        _shadow = 3;
        _radius = 8;
        _light = 1;
        _offset = 0;
      });
    }
  }

  void _onTapCancel() {
    if (_dark) {
      setState(() {
        _radius = 30;
        _light = 1;
      });
    } else {
      setState(() {
        _shadow = 3;
        _radius = 8;
        _light = 1;
        _offset = 0;
      });
    }
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
        _dark = true;
        setState(() {
          _shadow = 0;
          _radius = 30;
          _light = 1;
          _offset = 0;
        });
      } else if (brightness == Brightness.light) {
        _dark = false;
        setState(() {
          _shadow = 3;
          _radius = 8;
          _light = 1;
          _offset = 0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: widget.onPress,
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
                Icons.view_list,
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
