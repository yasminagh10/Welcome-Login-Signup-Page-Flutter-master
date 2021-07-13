import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/upload.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/services/database.dart';

class Instructor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Docscreen();
  }
}

class Docscreen extends State<Instructor> {
  List lectures = [
    'lec 1',
    'lec 2',
    'lec 3',
    'lec 4',
    'lec 5',
    'lec 6',
    'lec 7',
    'lec 8',
    'lec 9',
    'lec 10'
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('your material'),
        centerTitle: false,
        backgroundColor: Colors.purple,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.upload_outlined),
              tooltip: 'upload new material',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Upload();
                    },
                  ),
                );
              })
        ],
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: DataBase().getData(),
        builder: (context, snap) {
          if (snap.hasData) {
            return ListView.builder(
              itemCount: lectures.length,
              itemBuilder: (BuildContext context, index) {
                return ListTile(
                  title: Text(
                    '${lectures[index]}',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
