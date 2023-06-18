import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:study_manage/devInfo.dart';
import 'package:study_manage/live_stream_screen.dart';
import 'package:study_manage/piechart.dart';
import 'package:study_manage/start_stop.dart';

class MyWidget extends StatefulWidget {
  var drowsyArray;
  var yawnArray;
  var timestamp;
  MyWidget(
      {super.key, required this.drowsyArray, this.yawnArray, this.timestamp});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: size.height * 0.49,
          decoration: BoxDecoration(color: Color.fromARGB(255, 124, 202, 241)),
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                ),
                Text("Have a great Day!",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  height: 120,
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage(
                                        drowsyArray: widget.drowsyArray,
                                        yawnArray: widget.yawnArray,
                                        timestamp: widget.timestamp,
                                      )));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 229, 189, 243),
                              borderRadius: BorderRadius.circular(13)),
                          child: Column(
                            children: [
                              Icon(
                                Icons.pie_chart,
                                size: 100,
                              ),
                              Text('Current Session')
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StartStop(
                                        drowsyArray: widget.drowsyArray + 1,
                                        yawnArray: widget.yawnArray + 1,
                                        timestamp: widget.timestamp + 1,
                                      )));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 229, 189, 243),
                              borderRadius: BorderRadius.circular(13)),
                          child: Column(
                            children: [
                              Icon(
                                Icons.alarm_add,
                                size: 100,
                              ),
                              Text('Monitor')
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (() => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LiveStreamScreen()))
                            }),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 229, 189, 243),
                              borderRadius: BorderRadius.circular(13)),
                          child: Column(
                            children: [
                              Icon(
                                Icons.history,
                                size: 100,
                              ),
                              Text('Livestream')
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (() => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LiveStreamScreen()))
                              //FirebaseAuth.instance.signOut()
                            }),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 229, 189, 243),
                              borderRadius: BorderRadius.circular(13)),
                          child: Column(
                            children: [
                              Icon(
                                Icons.developer_mode,
                                size: 100,
                              ),
                              Text("Developer info")
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
