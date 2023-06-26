import 'package:flutter/material.dart';
import 'package:study_manage/new_home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:study_manage/piechart.dart';

class StartStop extends StatefulWidget {
  var drowsyArray;
  var yawnArray;
  var timestamp;
  StartStop(
      {super.key,
      required this.drowsyArray,
      this.yawnArray,
      required this.timestamp});

  @override
  State<StartStop> createState() => _StartStopState();
}

class _StartStopState extends State<StartStop> {
  double get_drowsy_percentage() {
    /*int count = 0, n = 0;
    print(widget.yawnArray);
    if (widget.drowsyArray != null) {
      for (var item in widget.drowsyArray as List<Object?>) {
        if (item != null) {
          if (item == 1) count++;
          n++;
        }
      }
    }
*/
    //print("percentage drowsy : " + (count * 100 / n).toString());
    //print((widget.drowsyArray + 1) * 100 / (widget.timestamp + 1));
    return (widget.drowsyArray) * 100 / (widget.timestamp);
  }

  double get_yawn_percentage() {
    /*int count = 0, n = 0;
    //print(widget.yawnArray);
    if (widget.yawnArray != null) {
      for (var item in widget.yawnArray as List<Object?>) {
        if (item != null) {
          if (item == 1) {
            count++;
          }
          n++;
        }
      }
    }
    //print('object is yawn ' + n.toString());
    //print("percentage yawn : " + (count * 100 / n).toString());*/
    //print((widget.yawnArray + 1) * 100 / (widget.timestamp + 1));
    return widget.yawnArray * 100 / (widget.timestamp);
  }

  @override
  Widget build(BuildContext context) {
    DateTime currenttime = DateTime.now();
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 300,
            ),
            ElevatedButton(
              onPressed: () async {
                FirebaseDatabase database = FirebaseDatabase.instance;
                DatabaseReference ref = FirebaseDatabase.instance.ref("/");
                ref.child('/drowsy').set({'drowsy_array': 1});
                ref.child('/yawn').set({'yawn_array': 1});
                ref.child('/Timestamp').set({'timestampval': 1});
                print(widget.drowsyArray);
                print(widget.yawnArray);

                final FirebaseFirestore _firestore = FirebaseFirestore.instance;
                double dd = get_drowsy_percentage(), yy = get_yawn_percentage();
                await _firestore
                    .collection('UserData')
                    .doc('Akhil')
                    .set({'endtime': currenttime});

                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Done'),
                      content: const Text('Started Monitoring'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyWidget(
                                          drowsyArray: widget.drowsyArray,
                                          yawnArray: widget.yawnArray,
                                          timestamp: widget.timestamp,
                                        )));
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
                //Navigator.push(context,
                //  MaterialPageRoute(builder: (context) => MyWidget()));
              },
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(Size(190, 50))),
              child: const Text('Start Tracking'),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                final FirebaseFirestore _firestore = FirebaseFirestore.instance;
                var dd = get_drowsy_percentage(),
                    yy = get_yawn_percentage(),
                    ts = widget.timestamp;
                await _firestore
                    .collection('UserData')
                    .doc(currenttime.toString())
                    .set({
                  'Attentive': (100 - dd - yy),
                  'Drowsy': (dd),
                  'endtime': (currenttime),
                  'yawn': (yy),
                  'Duration': ts
                });

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyWidget(
                              drowsyArray: widget.drowsyArray,
                              yawnArray: widget.yawnArray,
                              timestamp: widget.timestamp,
                            )));
                ;
              },
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(Size(190, 50))),
              child: const Text('Stop Tracking'),
            ),
          ],
        ),
      )),
    );
  }
}
