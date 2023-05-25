import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:study_manage/login_screen.dart';
import 'package:study_manage/overview_screen.dart';
import 'package:study_manage/piechart.dart';
import 'package:study_manage/user_info_page.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("/");
  DatabaseReference child = ref.child("drowsy");
  print("\n\n\n\n\n\n\n\n\nHello\n\n\n\n\n\n\n\n");

  final snapshot = await ref.child('drowsy').get();
  final snapshot1 = await ref.child('yawn').get();

  if (snapshot.exists && snapshot1.exists) {
    var data1 = snapshot.value!;
    var data2 = snapshot1.value!;
    //print(data2);
    // Use the value variable here or perform any necessary operations
    // Example:
    if (data1 != null && data2 != null) {
      List<dynamic> drowsyArray = (data1 as Map)["drowsy_array"];
      List<dynamic> yawnArray = (data2 as Map)["yawn_array"];

      print(yawnArray);

      runApp(MyApp(
        arr1: drowsyArray,
        arr2: yawnArray,
      ));
    }
  } else {
    runApp(MyApp(
      arr1: [],
      arr2: [],
    ));
    print('No data available.');
  }
}

class MyApp extends StatelessWidget {
  final List<dynamic> arr1;
  final List<dynamic> arr2;
  const MyApp({required this.arr1, required this.arr2});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      /* home: OverviewScreen(
        drowsyArray: arr1,
        yawnArray: arr2,
      ),*/

      home: LoginScreen(drowsyArrayl: arr1, yawnArrayl: arr2),

      //home: const HomeScreen(userName: 'John',),
    );
  }
}
