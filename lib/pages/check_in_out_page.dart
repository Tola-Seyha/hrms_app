import 'package:flutter/material.dart';

class CheckInOutPage extends StatefulWidget {
  const CheckInOutPage({super.key});

  @override
  State<CheckInOutPage> createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<CheckInOutPage> {
  bool isScanned = false;

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scanner"),
      ),
    );
  }
}
