import 'package:flutter/material.dart';

class ListContainer extends StatelessWidget {
  ListContainer({this.index});

  final int index;

  final List<Color> _colors = [Colors.yellow[200], Colors.yellow[700]];

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Text("标题", style: TextStyle(fontSize: 20, color: Colors.black54)),
          Container(
            child: Row(
              children: <Widget>[
                Icon(Icons.flag, color: Colors.black54, size: 20),
                Text("今天目标", style: TextStyle(color: Colors.black54)),
                Expanded(child: SizedBox()),
                Text("1/5", style: TextStyle(color: Colors.black54)),
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
                Text("20/100", style: TextStyle(color: Colors.black54)),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 4),
            child: Row(
              children: <Widget>[
                Icon(Icons.notifications, color: Colors.black54, size: 20),
                Text("重复提醒", style: TextStyle(color: Colors.black54)),
                Expanded(child: SizedBox()),
                Text("每天", style: TextStyle(color: Colors.black54)),
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
                Text("2020.2.1", style: TextStyle(color: Colors.black54)),
              ],
            ),
          ),
          Text("-------------------------",
              overflow: TextOverflow.fade,
              maxLines: 1,
              style: TextStyle(color: Colors.black54)),
          Text("这里是备注，天天学习！努力向上！", style: TextStyle(color: Colors.black54))
        ],
      ),
    );
  }
}
