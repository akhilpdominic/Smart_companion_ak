import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:study_manage/login_screen.dart';
import 'package:study_manage/new_home_page.dart';
import 'package:study_manage/start_stop.dart';
import 'package:study_manage/user_info_page.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("/");
  DatabaseReference child = ref.child("drowsy");

  final snapshot = await ref.child('drowsy').get();
  final snapshot1 = await ref.child('yawn').get();
  final snapshot2 = await ref.child('Timestamp').get();

  if (snapshot.exists && snapshot1.exists) {
    var data1 = snapshot.value!;
    var data2 = snapshot1.value!;
    var data3 = snapshot2.value!;

    print(data1);
    print(data2);
    //print(data2);
    // Use the value variable here or perform any necessary operations
    // Example:
    int drowsyArray = (data1 as Map)["drowsy_array"];
    int yawnArray = (data2 as Map)["yawn_array"];
    int tsarray = (data3 as Map)["timestampval"];

    print(yawnArray);
    print(drowsyArray);
    print(tsarray);
    runApp(MyApp(arr1: drowsyArray, arr2: yawnArray, arr3: tsarray));
  } else {
    runApp(const MyApp(
      arr1: 5,
      arr2: 5,
      arr3: 5,
    ));
    print('No data available.');
  }
}

class MyApp extends StatelessWidget {
  //final List<dynamic> arr1;
  //final List<dynamic> arr2;

  final int arr1;
  final int arr2;
  final int arr3;
  const MyApp(
      {super.key, required this.arr1, required this.arr2, required this.arr3});
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

      //home: UserInfoPage(drowsyArrayu: arr1, yawnArrayu: arr2),

      home: MyWidget(
        drowsyArray: arr1,
        yawnArray: arr2,
        timestamp: arr3.toDouble(),
      ),

      //home: const HomeScreen(userName: 'John',),
    );
  }
}
