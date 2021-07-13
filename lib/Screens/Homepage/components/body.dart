import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Models/UserModel.dart';
import 'package:flutter_auth/Screens/gradetwo/gradetwo.dart';
import 'package:flutter_auth/Screens/instructor.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/Screens/Homepage/components/background.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/services/database.dart';

class Body extends StatelessWidget {
  final UserModel userModel;

  Body({Key key, this.userModel}) : super(key: key);

  static UserModel user;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<DocumentSnapshot>(
        //GetUser Info with its id when login firebase auth provide us uid
        future: DataBase().getUserInfo("sE91xBdu68etgjuQ3xfNtatPsds2"),
        builder: (context, snapshot) {
          //get user info from fields
          if (snapshot.hasData) {
            //Loading user data from firebase
            // String email = snapshot.data.get("Email");
            String email = FirebaseAuth.instance.currentUser.email;
            String userName = snapshot.data.get("UserName");
            String role = snapshot.data.get("Position");
            //Put it into user model
            user = UserModel(userName, email, FirebaseAuth.instance.currentUser.uid, role);
            //
            print("This user $userName is ${role == "Student" ? "Student" : "Doctor"}  email $email");
            if (role == "Student") {
              return Background(
                  child: SingleChildScrollView(
                      child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RoundedButton(
                    text: "grade one",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            int m = DateTime.now().month;
                            if (m > 9 && m < 2) {
                              return Grade([
                                'math 1',
                                'discrete',
                                'computer programing',
                                'introduction',
                                'physics',
                                'english',
                              ]);
                            } else {
                              return Grade([
                                'management',
                                'Logic',
                                'math2',
                                'computer language1',
                                'statistics',
                                'OS1',
                                'information system'
                              ]);
                            }
                          },
                        ),
                      );
                    },
                  ),
                  RoundedButton(
                    text: "grade two",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            int m = DateTime.now().month;
                            if (m > 9 && m < 2) {
                              return Grade([
                                'logic',
                                'computer programing',
                                'data structure',
                                'OR',
                              ]);
                            } else {
                              return Grade([
                                'computer organisation',
                                'data structure',
                                'web design',
                                'OR',
                                'computer ethics',
                                'system analysis',
                              ]);
                            }
                          },
                        ),
                      );
                    },
                  ),
                  RoundedButton(
                    text: "grade three",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            int m = DateTime.now().month;
                            if (m > 9 && m < 2) {
                              return Grade([
                                'data base',
                                'network',
                                'computer language 2',
                                'software engineering',
                                'image processing',
                                'signal',
                              ]);
                            } else {
                              return Grade([
                                'AI',
                                'computer graphics',
                                'pattern recognition',
                                'system analysis2',
                                'android',
                                'computer engineering',
                                'database2'
                              ]);
                            }
                          },
                        ),
                      );
                    },
                  ),
                  RoundedButton(
                    text: "grade four",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            int m = DateTime.now().month;
                            if (m > 9 && m < 2) {
                              return Grade([
                                'data mining',
                                'kps',
                                'expert system',
                                'multimedia',
                                'security',
                              ]);
                            } else {
                              return Grade([
                                'gis',
                                'distributed system',
                                'NLP',
                                'information network',
                              ]);
                            }
                          },
                        ),
                      );
                    },
                  ),
                ],
              )));
            } else {
              return Instructor();
            }
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
