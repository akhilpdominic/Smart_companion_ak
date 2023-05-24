import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:study_manage/login_screen.dart';
import 'package:study_manage/overview_screen.dart';
import 'package:study_manage/user_info_page.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

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

  // final snapshot = await ref.child('drowsy').get();
  // if (snapshot.exists) {
  //   var data = snapshot.value!;
  //   print(data);
  //   Object? value = data["drowsy_array"];
  //   print(snapshot.value.runtimeType);
  // } else {
  //   print('No data available.');
  // }
  // print("\n\n\n\nbye\n\n\n\n");

  final snapshot = await ref.child('drowsy').get();
  if (snapshot.exists) {
    var data = snapshot.value!;
    print(data);
    // Object? value = data.value;
    print(snapshot.value.runtimeType);

    // Use the value variable here or perform any necessary operations
    // Example:
    if (data != null) {
      List<dynamic> drowsyArray = (data as Map)["drowsy_array"];
      print(drowsyArray);
      print(drowsyArray.runtimeType);
    }
  } else {
    print('No data available.');
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: LoginScreen(),
      //home: const HomeScreen(userName: 'John',),
    );
  }
}
