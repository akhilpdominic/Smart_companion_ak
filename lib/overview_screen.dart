import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:firebase_database/firebase_database.dart';

class OverviewScreen extends StatefulWidget {
  @override
  _OverviewScreenState createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  int _selectedIndex = 1;
  List<dynamic> drowsyArray = [];

  @override
  void initState() {
    super.initState();
    fetchDataFromFirebase();
  }

  void fetchDataFromFirebase() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("/");
    DatabaseReference child = ref.child("drowsy");

    DataSnapshot snapshot = await child.get();
    if (snapshot.exists) {
      var data = snapshot.value!;
      setState(() {
        drowsyArray = (data as Map)["drowsy_array"];
      });
    } else {
      print('No data available.');
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Handle navigation based on the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Overview'),
      ),
      body: Center(
        child: drowsyArray.isNotEmpty
            ? PieChart(
                PieChartData(
                  sections: List.generate(
                    drowsyArray.length,
                    (index) {
                      double value = drowsyArray[index].toDouble(); // Convert int to double
                      Color color = Colors.accents[index % Colors.accents.length];
                      return PieChartSectionData(
                        value: value,
                        color: color,
                        title: '${value.toStringAsFixed(1)}%',
                        radius: 80,
                      );
                    },
                  ),
                ),
              )
            : CircularProgressIndicator(),
      ),
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
