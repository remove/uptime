import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uptime/model/providerModel.dart';

class TomatoCountPanel extends StatefulWidget {
  @override
  _TomatoCountPanelState createState() => _TomatoCountPanelState();
}

class _TomatoCountPanelState extends State<TomatoCountPanel> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 10),
              blurRadius: 40,
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        constraints: BoxConstraints(
          minHeight: 100,
          maxHeight: 100,
        ),
        margin: EdgeInsets.only(left: 10, right: 20, bottom: 20, top: 20),
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "总计番茄",
              style: TextStyle(color: Colors.black54),
            ),
            Expanded(
              child: Consumer(
                builder: (context, ProviderModel providerModel, _) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      providerModel.tomatoSchedule.toString(),
                      style: TextStyle(color: Colors.black26, fontSize: 30),
                    ),
                    Text(
                      "/",
                      style: TextStyle(color: Colors.black26, fontSize: 35),
                    ),
                    Text(
                      providerModel.tomatoGoal.toString(),
                      style: TextStyle(color: Colors.deepOrange, fontSize: 35),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
