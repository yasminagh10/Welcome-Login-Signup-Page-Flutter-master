import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'QRScannerPage.dart';

class QRPage extends StatefulWidget {
  @override
  _QRPageState createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  String qrData = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              QrImage(
                data: qrData,
                version: QrVersions.auto,
                size: 200.0,
              ),
              TextField(
                decoration: InputDecoration(hintText: "Enter Your String"),
                onChanged: (newVal) {
                  qrData = newVal;
                },
              ),
              RaisedButton(
                child: Text("Code Scanner"),
                onPressed: () {
                  print("New Data : $qrData");
                  setState(() {
                    qrData = qrData;
                  });
                },
              )
            ],
          )),
    );
  }
}
