import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Models/LeCSecModel.dart';
import 'package:flutter_auth/QRCode/MainPageWrapper.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/services/database.dart';
class AdminHome extends StatefulWidget {
  static String instructorName="";
  @override
  State<StatefulWidget> createState() {
    return Lecscreen();
  }
}

class Lecscreen extends State<AdminHome> {
  List<Lec_SecModel> myLectures = List();
 List<String>courses=[];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      appBar: AppBar(
        title: Text('your lectures'),
        centerTitle: false,
        backgroundColor: Colors.purple,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.zoom_out_map),
              tooltip: 'take your attendance',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MainPageWrapper();
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
            for (var lec in snap.data.docs) {
              String lecture = lec.get("date");
              String instructor = lec.get("instructor");
              String courseName = lec.get("courseName");
              bool isLec = lec.get("islecture");
              String url = lec.get("url");
              if (AdminHome.instructorName == instructor) {
                myLectures.add(
                    Lec_SecModel(lecture, courseName, instructor, isLec));
                if(!courses.contains(courseName))
                  courses.add(courseName);
              }
            }
            return ListView.builder(
              itemCount: courses.length,
              itemBuilder: (BuildContext context, index) {
                return ListTile(
                  title: Text(
                    '${courses[index]}',
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