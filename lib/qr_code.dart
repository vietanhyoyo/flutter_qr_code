import 'package:flutter/material.dart';
import 'package:qr_code_project/scan_qr.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeScreen extends StatefulWidget {
  const QRCodeScreen({super.key});
  @override
  _QRCodeScreenState createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {
  late String data;

  @override
  void initState() {
    super.initState();
    data = "Data QR";
  }

  void updateQRCode(String newData) {
    setState(() {
      data = newData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: QrImageView(
                data: data,
                version: QrVersions.auto,
                size: 200.0,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ScanScreen(title: 'Scanner'),
                ),
              );
            },
            child: const Text('Scan QR Code'),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextFormField(
              initialValue: data,
              onChanged: (value) {
                updateQRCode(value);
              },
              decoration: InputDecoration(
                labelText: 'QR Code Data',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
