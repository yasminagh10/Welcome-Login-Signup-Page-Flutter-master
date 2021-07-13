import 'package:flutter/material.dart';
import 'QRState.dart';

class QRScannerPage extends StatefulWidget {
  @override
  _QRScannerPageState createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: QRScanner(),
      ),
    );
  }
}
