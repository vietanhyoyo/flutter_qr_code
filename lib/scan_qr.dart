import 'dart:async';

import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';

class ScanScreen extends StatefulWidget {
  ScanScreen({super.key, required this.title});

  final String title;

  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<ScanScreen> {
  String barcode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child: Text('Scan Result: $barcode')),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: scan,
              child: Text('Start Scan'),
            ),
          ],
        ),
      ),
    );
  }

  Future scan() async {
    try {
      var result = await BarcodeScanner.scan();
      setState(() => barcode = result.rawContent);
    } catch (e) {
      setState(() => barcode = 'Unknown error: $e');
    }
  }
}