import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

int a = -1, b = -1;

class getFirestoredata extends StatelessWidget {
  final String documentid;

  getFirestoredata({required this.documentid});

  @override
  Widget build(BuildContext context) {
    CollectionReference stopsdata =
        FirebaseFirestore.instance.collection("UserData");

    return FutureBuilder<DocumentSnapshot>(
        future: stopsdata.doc(documentid).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;

            return Card(
              shadowColor: Colors.black,
              child: SizedBox(
                  width: 300,
                  height: 100,
                  child: Text(
                    "Attentiveness: ${data['Attentive']}\nDrowsy: ${data['Drowsy']}\nTimestamp: ${data['Duration']}\nyawn: ${data['yawn']}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blue),
                  )),
            );
          }
          return Text('Loading..');
        }));
  }
}
