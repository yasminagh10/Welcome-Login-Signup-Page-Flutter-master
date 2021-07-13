import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Homepage/components/body.dart';
import 'package:flutter_auth/Screens/lecture.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';

class Grade extends StatefulWidget {
   static bool isLec=false;
   static String courseName="";
  List courses;
  Grade(this.courses);
  @override
  State<StatefulWidget> createState() {
    return _Gradetwo(courses);
  }
}

class _Gradetwo extends State<Grade> {
  List courses;
  _Gradetwo(this.courses);

  @override
  void initState() {
    print("in grade page saved user data ${Body.user.name} ${Body.user.email} ${Body.user.type}");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('your subjects'),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        body: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                  textAlign: TextAlign.left,
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                onTap: () {
                   Grade.courseName=courses[index];
                  YYDialog a = YYDialog().build(context)
                    ..width = 120
                    ..height = 130
                    ..backgroundColor = Colors.white.withAlpha(250)
                    ..gravityAnimationEnable = true
                    ..gravity = Gravity.top
                    ..borderRadius = 30
                    ..margin = EdgeInsets.only(top: 230)
                    ..animatedFunc = (child, animation) {
                      return ScaleTransition(
                        child: child,
                        scale: Tween(begin: 0.0, end: 1.0).animate(animation),
                      );
                    };
                  a
                    ..widget(
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Container(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                              children: [
                                SizedBox(height: 20,),
                                ElevatedButton(
                                  child: Text("Lecture"),
                                  onPressed: () {
                                    Grade.isLec = true;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Lecture()));
                                  },
                                ),
                                ElevatedButton(
                                  child: Text("Section"),
                                  onPressed: () {
                                    Grade.isLec = false;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Lecture()));
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    ..show();
                },
              );
            }));
  }
}
