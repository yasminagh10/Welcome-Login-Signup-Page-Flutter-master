import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class Upload extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Uploadscreen();
  }
}

class Uploadscreen extends State<Upload> {
  String grade = null;
  String course = null;

  void dropgrade(String val1) {
    setState(() {
      grade = val1;
    });
  }

  void dropcourse(String val2) {
    setState(() {
      course = val2;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text('upload material'),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        body: Container(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.10),
              SizedBox(
                  width: size.width * 0.8,
                  child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: kPrimaryLightColor,
                        border: InputBorder.none,
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      iconSize: 35,
                      hint: Text('chooce grade'),
                      dropdownColor: kPrimaryLightColor,
                      onChanged: dropgrade,
                      value: grade,
                      items: <String>[
                        'grade one',
                        'grade two',
                        'grade three',
                        'grade four'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          child: Text(value),
                          value: value,
                        );
                      }).toList())),
              SizedBox(height: size.height * 0.05),
              SizedBox(
                  width: size.width * 0.8,
                  child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: kPrimaryLightColor,
                        border: InputBorder.none,
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      iconSize: 35,
                      hint: Text('chooce course name'),
                      dropdownColor: kPrimaryLightColor,
                      onChanged: dropcourse,
                      value: course,
                      items: <String>[
                        'grade one',
                        'grade two',
                        'grade three',
                        'grade four'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          child: Text(value),
                          value: value,
                        );
                      }).toList())),
              SizedBox(height: size.height * 0.05),
              TextField(
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: kPrimaryLightColor,
                  border: InputBorder.none,
                  hintText: 'enter material URL',
                ),
              ),
        /*  Navigator.push(context,  MaterialPageRoute(
              builder: (BuildContext context) =>sinign()));*/
            ],
          ),
        ));
  }
}
