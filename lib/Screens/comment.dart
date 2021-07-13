import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return comment();
  }
}

class comment extends State<page> {
  List users = [
    {'name': 'amera', 'comment': 'nooooooooooo'},
    {'name': 'hanan', 'comment': 'yes.............'},
    {'name': 'yasmina', 'comment': 'yup.............'}
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Column(children: [
          SizedBox(height: size.height * 0.05),
          Flexible(
            flex: 5,
            child: Image.asset(
              "assets/images/pdf.jpg",
              width: size.width * .4,
              height: size.height * .4,
            ),
          ),
          Flexible(
            flex: 5,
            child: Text(
              "LECTURE NAME",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Flexible(
            flex: 10,
            child: ListView.builder(
                padding: EdgeInsets.only(
                  left: 0,
                ),
                itemCount: users.length,
                itemBuilder: (BuildContext context, index) {
                  return ListTile(
                    title: Text(
                      '${users[index]['name']}',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    subtitle: Text(
                      '${users[index]['comment']}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor),
                    ),
                  );
                }),
          ),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: TextField(
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: kPrimaryLightColor,
                    border: InputBorder.none,
                    hintText: 'enter comment',
                  ),
                ),
              ),
              FlatButton.icon(
                onPressed: () {},
                icon: Icon(Icons.send),
                label: Text('send'),
                color: kPrimaryColor,
                textColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
              ),
            ],
          ),
        ]));
  }
}
