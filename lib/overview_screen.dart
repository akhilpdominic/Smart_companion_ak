import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

int count = 0;

class OverviewScreen extends StatefulWidget {
  final List<dynamic> drowsyArray;

  const OverviewScreen({required this.drowsyArray});

  @override
  _OverviewScreenState createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  int _selectedIndex = 1;

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
        child: LineChart(
          LineChartData(
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(0, 1),
                  FlSpot(1, 1),
                  FlSpot(2, 0),
                  FlSpot(3, 0),
                  FlSpot(4, 0),
                  FlSpot(5, 1),
                  FlSpot(6, 1),
                  FlSpot(7, 0),
                  FlSpot(8, 1),
                ],
                isCurved: true,
                barWidth: 4,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
              ),
            ],
            minY: 0,
            titlesData: FlTitlesData(),
            gridData: FlGridData(),
            borderData: FlBorderData(),
          ),
        ),
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
