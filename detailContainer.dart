import 'package:flutter/material.dart';
import 'package:uptime/taskEdit.dart';

class DetailContainer extends StatefulWidget {
  DetailContainer({
    @required this.index,
  });

  final int index;

  @override
  _DetailContainerState createState() => _DetailContainerState();
}

class _DetailContainerState extends State<DetailContainer> {
  final List<Color> _colors = [Colors.yellow[200], Colors.yellow[700]];
  double _width = 0;
  double _height = 0;
  double _opacity = 0;
  double _detailOpacity = 0;
  bool _detail = false;

  @override
  void initState() {
    Future(() {
      setState(() {
        _width = 350;
        _height = 400;
        _opacity = 1;
      });
    });
    Future.delayed(Duration(milliseconds: 260), () {
      setState(() {
        _detail = true;
        _detailOpacity = 1;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true,
      child: AnimatedOpacity(
        opacity: _opacity,
        duration: Duration(milliseconds: 300),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                offset: Offset(3, 4),
              ),
            ],
            gradient: RadialGradient(
              colors: _colors,
              radius: 1.3,
              center: Alignment.topLeft,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          constraints: BoxConstraints(
            minWidth: _width,
            minHeight: _height,
          ),
          margin: EdgeInsets.all(9),
          padding: EdgeInsets.all(10),
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 150),
            opacity: _detailOpacity,
            child: _detail ? TaskEdit(index: widget.index,) : SizedBox(),
          ),
        ),
      ),
    );
  }
}
