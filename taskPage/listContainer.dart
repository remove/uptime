import 'package:flutter/material.dart';
import 'package:littledecisive/model/providerModel.dart';
import 'package:provider/provider.dart';

class ListContainer extends StatefulWidget {
  ListContainer({
    this.index,
    this.callback,
  });

  final int index;
  final callback;

  @override
  ListContainerState createState() => ListContainerState();
}

class ListContainerState extends State<ListContainer> {
  final List<Color> _colors = [Colors.yellow[200], Colors.yellow[700]];

  //显示详情
  _showDetail() {
    widget.callback(widget.index, false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showDetail,
      child: Stack(
        children: <Widget>[
          Container(
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
            child: buildList(),
          ),
        ],
      ),
    );
  }

  Consumer<ProviderModel> buildList() {
    return Consumer(
      builder: (context, ProviderModel providerModel, _) => Column(
        children: <Widget>[
          SizedBox(
            height: 30,
            child: Text(providerModel.dataList[widget.index][0],
                style: TextStyle(fontSize: 20, color: Colors.black54)),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Icon(Icons.flag, color: Colors.black54, size: 20),
                Text("今天目标", style: TextStyle(color: Colors.black54)),
                Expanded(child: SizedBox()),
                Text(
                    providerModel.scheduleList[widget.index][0] +
                        "/" +
                        trans(providerModel.dataList[widget.index][1]),
                    style: TextStyle(color: Colors.black54)),
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
                Text(
                    providerModel.scheduleList[widget.index][1] +
                        "/" +
                        trans(providerModel.dataList[widget.index][2]),
                    style: TextStyle(color: Colors.black54)),
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
                Text(providerModel.dataList[widget.index][3],
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
                Text(providerModel.dataList[widget.index][4],
                    style: TextStyle(color: Colors.black54)),
              ],
            ),
          ),
          Text("-------------------------",
              overflow: TextOverflow.fade,
              maxLines: 1,
              style: TextStyle(color: Colors.black54)),
          Text(providerModel.dataList[widget.index][5],
              style: TextStyle(color: Colors.black54))
        ],
      ),
    );
  }

  String trans(String data) {
    if (data.startsWith("0")) {
      return "无限";
    }
    return data;
  }
}
