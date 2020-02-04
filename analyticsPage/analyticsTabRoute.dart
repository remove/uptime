import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnalyticsTabRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            child: Text(
              "统计",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            padding: EdgeInsets.only(top: 50, left: 20),
          ),
          Expanded(
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.only(top: 15, left: 20, right: 20),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 20),
                            blurRadius: 30)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    constraints: BoxConstraints(
                        maxHeight: 200, minWidth: double.infinity),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Text("番茄数/天"),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Text(
                            "最近七天",
                            style: TextStyle(color: Colors.black45),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                constraints: BoxConstraints(
                                  maxWidth: 30,
                                  minWidth: 30,
                                  minHeight: 70,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(top: 7),
                                      child: Text(
                                        "7",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                constraints: BoxConstraints(
                                  minWidth: 30,
                                  maxHeight: 40,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(top: 7),
                                      child: Text(
                                        "4",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                constraints: BoxConstraints(
                                  minWidth: 30,
                                  maxHeight: 50,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(top: 7),
                                      child: Text(
                                        "5",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                constraints: BoxConstraints(
                                  minWidth: 30,
                                  maxHeight: 120,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(top: 7),
                                      child: Text(
                                        "12",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                constraints: BoxConstraints(
                                  minWidth: 30,
                                  maxHeight: 60,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(top: 7),
                                      child: Text(
                                        "6",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                constraints: BoxConstraints(
                                  minWidth: 30,
                                  maxHeight: 100,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(top: 7),
                                      child: Text(
                                        "10",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                constraints: BoxConstraints(
                                  minWidth: 30,
                                  maxHeight: 110,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(top: 7),
                                      child: Text(
                                        "11",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.only(top: 15, left: 20, right: 20),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 20),
                            blurRadius: 30)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    constraints: BoxConstraints(
                        maxHeight: 200, minWidth: double.infinity),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Text("任务完成数/天"),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Text(
                            "最近七天",
                            style: TextStyle(color: Colors.black45),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                constraints: BoxConstraints(
                                  maxWidth: 30,
                                  minWidth: 30,
                                  minHeight: 40,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(top: 7),
                                      child: Text(
                                        "2",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                constraints: BoxConstraints(
                                  minWidth: 30,
                                  maxHeight: 80,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(top: 7),
                                      child: Text(
                                        "4",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                constraints: BoxConstraints(
                                  minWidth: 30,
                                  maxHeight: 60,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(top: 7),
                                      child: Text(
                                        "3",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                constraints: BoxConstraints(
                                  minWidth: 30,
                                  maxHeight: 100,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(top: 7),
                                      child: Text(
                                        "5",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                constraints: BoxConstraints(
                                  minWidth: 30,
                                  maxHeight: 60,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(top: 7),
                                      child: Text(
                                        "3",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                constraints: BoxConstraints(
                                  minWidth: 30,
                                  maxHeight: 80,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(top: 7),
                                      child: Text(
                                        "4",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                constraints: BoxConstraints(
                                  minWidth: 30,
                                  maxHeight: 100,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(top: 7),
                                      child: Text(
                                        "5",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
