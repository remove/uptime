import 'package:flutter/material.dart';
import 'package:littledecisive/taskPage/taskEdit.dart';

class EditDetailContainer extends StatefulWidget {
  EditDetailContainer({
    @required this.index,
    @required this.callback,
    @required this.newTask,
  });

  //任务索引
  final int index;

  //切换编辑对话框是否显示
  final callback;

  //是否是新建任务
  final bool newTask;

  @override
  _EditDetailContainerState createState() => _EditDetailContainerState();
}

class _EditDetailContainerState extends State<EditDetailContainer> {
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
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Visibility(
        visible: true,
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(milliseconds: 100),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white24,
              boxShadow: [
                BoxShadow(
                  color: Colors.white70,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Center(
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
                  child: _detail
                      ? TaskEdit(
                          newTask: widget.newTask,
                          callback: widget.callback,
                          index: widget.index,
                        )
                      : SizedBox(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
