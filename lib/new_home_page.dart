import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:study_manage/devInfo.dart';
import 'package:study_manage/history.dart';
import 'package:study_manage/live_stream_screen.dart';
import 'package:study_manage/piechart.dart';
import 'package:study_manage/start_stop.dart';

class MyWidget extends StatefulWidget {
  var drowsyArray;
  var yawnArray;
  double timestamp;
  MyWidget(
      {super.key,
      required this.drowsyArray,
      this.yawnArray,
      required this.timestamp});

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
                Text("Hello There!",
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
                              color: Color.fromARGB(255, 0, 89, 121),
                              borderRadius: BorderRadius.circular(13)),
                          child: Column(
                            children: [
                              Icon(
                                Icons.pie_chart,
                                color: Colors.white,
                                size: 100,
                              ),
                              Text(
                                'Current Session',
                                style: TextStyle(color: Colors.white),
                              )
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
                              color: Color.fromARGB(255, 0, 89, 121),
                              borderRadius: BorderRadius.circular(13)),
                          child: Column(
                            children: [
                              Icon(
                                Icons.analytics,
                                color: Colors.white,
                                size: 100,
                              ),
                              Text(
                                'Monitor',
                                style: TextStyle(color: Colors.white),
                              )
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
                              color: Color.fromARGB(255, 0, 89, 121),
                              borderRadius: BorderRadius.circular(13)),
                          child: Column(
                            children: [
                              Icon(
                                Icons.video_call,
                                color: Colors.white,
                                size: 100,
                              ),
                              Text(
                                'Livestream',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (() => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => firestoreTest()))
                              //FirebaseAuth.instance.signOut()
                            }),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 89, 121),
                              borderRadius: BorderRadius.circular(13)),
                          child: Column(
                            children: [
                              Icon(
                                Icons.history,
                                color: Colors.white,
                                size: 100,
                              ),
                              Text(
                                "Previous Data",
                                style: TextStyle(color: Colors.white),
                              )
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
