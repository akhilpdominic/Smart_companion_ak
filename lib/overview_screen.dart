import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:study_manage/piechart.dart';

class OverviewScreen extends StatefulWidget {
  final Object? drowsyArray;
  final Object? yawnArray;

  const OverviewScreen({required this.drowsyArray, this.yawnArray});

  @override
  _OverviewScreenState createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  int _selectedIndex = 1;

  double get_drowsy_percentage() {
    int count = 0, n = 0;
    print(widget.yawnArray);
    if (widget.drowsyArray != null) {
      for (var item in widget.drowsyArray as List<Object?>) {
        if (item != null) {
          if (item == 1) count++;
          n++;
        }
      }
    }

    //print("percentage drowsy : " + (count * 100 / n).toString());
    return count * 100 / n;
  }

  double get_yawn_percentage() {
    int count = 0, n = 0;
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
    //print("percentage yawn : " + (count * 100 / n).toString());
    return count * 100 / n;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Handle navigation based on the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    double dd = get_drowsy_percentage(), yy = get_yawn_percentage();

    return Scaffold(
      appBar: AppBar(
        title: Text('Overview'),
      ),
      body: Text("hello"),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Study',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: 'Overview',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videocam),
            label: 'Live Stream',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
