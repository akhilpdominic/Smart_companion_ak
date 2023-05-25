import 'package:flutter/material.dart';
import 'package:study_manage/piechart.dart';
import 'package:study_manage/user_info_page.dart';
import 'overview_screen.dart';
import 'live_stream_screen.dart';

class HomeScreen extends StatefulWidget {
  final String userName;
  final List<dynamic> drowsyArrayh;
  final List<dynamic> yawnArrayh;
  const HomeScreen(
      {required this.userName,
      required this.drowsyArrayh,
      required this.yawnArrayh});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<dynamic> drowsyArray = []; // Add this line to store the Firestore value

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      /*Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OverviewScreen(
            drowsyArray: [],
          ), // Pass the Firestore value here
        ),
      );*/
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LiveStreamScreen(),
        ),
      );
    } else {
      // Handle other bottom navigation items if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StudyMate'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Hi ${widget.userName}\'s Parents',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => HomePage(
                          drowsyArray: widget.drowsyArrayh,
                          yawnArray: widget.yawnArrayh,
                        )));
              },
              child: Text('Start Tracking ${widget.userName}'),
            ),
          ),
        ],
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
