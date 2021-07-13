import 'package:flutter/material.dart';
import 'QRPage.dart';
import 'QRScannerPage.dart';

class MainPageWrapper extends StatefulWidget {
  @override
  _MainPageWrapperState createState() => _MainPageWrapperState();
}

class _MainPageWrapperState extends State<MainPageWrapper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RaisedButton(
            child: Text("Student"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => QRScannerPage()));
            },
          ),
          RaisedButton(
            child: Text("Professor"),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => QRPage()));
            },
          ),
        ],
      ),
    );
  }
}
