import 'package:flutter/material.dart';
import 'package:uptime/taskModel.dart';

class ListContainer extends StatefulWidget {
  ListContainer({this.index, this.callback});

  final int index;
  final callback;

  @override
  _ListContainerState createState() => _ListContainerState();
}

class _ListContainerState extends State<ListContainer> {
  final List<Color> _colors = [Colors.yellow[200], Colors.yellow[700]];
  String _title = "";
  String _flag = "";
  String _done = "";
  String _notification = "";
  String _endDate = "";
  String _note = "";
  bool _visible = true;
  double _opacity = 1;

  @override
  void initState() {
    Future(() {
      TaskModel(index: widget.index).getData().then((list) {
        setState(() {
          _title = list[0];
          _flag = list[1];
          _done = list[2];
          _notification = list[3];
          _endDate = list[4];
          _note = list[5];
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _opacity = _visible ? 0 : 1;
          _visible = !_visible;
        });
        widget.callback(widget.index);
      },
      child: Stack(
        children: <Widget>[
          AnimatedOpacity(
            duration: Duration(milliseconds: 100),
            opacity: _opacity,
            child: Container(
              margin: EdgeInsets.all(7),
              padding: EdgeInsets.all(10),
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
                minWidth: double.infinity,
                minHeight: 60,
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                    child: Text(_title,
                        style: TextStyle(fontSize: 20, color: Colors.black54)),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.flag, color: Colors.black54, size: 20),
                        Text("今天目标", style: TextStyle(color: Colors.black54)),
                        Expanded(child: SizedBox()),
                        Text("$_flag/$_flag", style: TextStyle(color: Colors.black54)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 4),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.timer, color: Colors.black54, size: 20),
                        Text("总计完成", style: TextStyle(color: Colors.black54)),
                        Expanded(child: SizedBox()),
                        Text("$_done/$_done", style: TextStyle(color: Colors.black54)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 4),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.notifications,
                            color: Colors.black54, size: 20),
                        Text("重复提醒", style: TextStyle(color: Colors.black54)),
                        Expanded(child: SizedBox()),
                        Text(_notification,
                            style: TextStyle(color: Colors.black54)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 4),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.date_range, color: Colors.black54, size: 20),
                        Text("结束日期", style: TextStyle(color: Colors.black54)),
                        Expanded(child: SizedBox()),
                        Text(_endDate, style: TextStyle(color: Colors.black54)),
                      ],
                    ),
                  ),
                  Text("-------------------------",
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      style: TextStyle(color: Colors.black54)),
                  Text(_note, style: TextStyle(color: Colors.black54))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
