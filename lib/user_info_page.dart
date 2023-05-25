import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_manage/home_screen.dart';

class UserInfoPage extends StatefulWidget {
  final List<dynamic> drowsyArrayu;
  final List<dynamic> yawnArrayu;
  const UserInfoPage({required this.drowsyArrayu, required this.yawnArrayu});
  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  final _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? _selectedClass;
  final List<String> _classList = [
    'LKG',
    'UKG',
    'Class 1',
    'Class 2',
    'Class 3',
    'Class 4',
    'Class 5',
    'Class 6',
    'Class 7',
    'Class 8',
    'Class 9',
    'Class 10',
    'Class 11',
    'Class 12',
  ];

  String? _selectedSex;
  final List<String> _sexList = [
    'Male',
    'Female',
  ];

  String? _selectedAge;
  final List<String> _ageList = [
    '4 years',
    '5 years',
    '6 years',
    '7 years',
    '8 years',
    '9 years',
    '10 years',
    '11 years',
    '12 years',
    '13 years',
    '14 years',
    '15 years',
    '16 years',
    '17 years',
    '18 years',
    '19 years',
  ];

  TextEditingController _nameController = TextEditingController();

  void _submitUserInfo() async {
    final name = _nameController.text;

    if (name.isEmpty ||
        _selectedAge == null ||
        _selectedSex == null ||
        _selectedClass == null) {
      // Perform validation and show error if any field is empty
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please fill in all the fields.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    try {
      await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
        'name': name,
        'age': _selectedAge,
        'sex': _selectedSex,
        'class': _selectedClass,
      });

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('User information added successfully.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => HomeScreen(
                            userName: name,
                            drowsyArrayh: widget.drowsyArrayu,
                            yawnArrayh: widget.yawnArrayu,
                          )));
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to add user information. Please try again.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Information'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Age:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _selectedAge,
                items: _ageList.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedAge = value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Sex:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _selectedSex,
                items: _sexList.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedSex = value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Class:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _selectedClass,
                items: _classList.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedClass = value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitUserInfo,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
