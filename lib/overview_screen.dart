import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class OverviewScreen extends StatefulWidget {
  final String userName;
  //final List<int> drowsy_val;

  const OverviewScreen({required this.userName});

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
                  FlSpot(0, 10),
                  FlSpot(1, 15),
                  FlSpot(2, 12),
                  // Add more data points for other months
                ],
                isCurved: true,
                // colors: [
                //   GradientColor(
                //     gradientFrom: Offset(0.5, 0),
                //     gradientTo: Offset(0.5, 1),
                //     colorStops: [0.0, 0.5, 1.0],
                //     colors: [Colors.blue, Colors.green, Colors.yellow],
                //   ),
                // ],
                barWidth: 4,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
              ),
            ],
            minY: 0,
            titlesData: FlTitlesData(),
            // axisTitleData: FlAxisTitleData(),
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
