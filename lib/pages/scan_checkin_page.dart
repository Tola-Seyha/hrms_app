import 'package:flutter/material.dart';
import 'package:hrms_app/models/checkin_provider.dart';
import 'package:hrms_app/pages/checkin_detail_page.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';

class ScanCheckInPage extends StatefulWidget {
  const ScanCheckInPage({super.key});

  @override
  State<ScanCheckInPage> createState() => _ScanCheckInPageState();
}

class _ScanCheckInPageState extends State<ScanCheckInPage> {
  bool _scanned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan QR to Check In')),
      body: MobileScanner(
        onDetect: (barcodeCapture) {
          if (_scanned) return;
          final String? code = barcodeCapture.barcodes.first.rawValue;
          if (code == null) return;

          _scanned = true;

          // You can validate QR value here (example: company_checkin)
          if (code == 'company_checkin') {
            context.read<CheckInProvider>().checkIn();

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const CheckInDetailPage()),
            );
          } else {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Invalid QR Code')));
            _scanned = false;
          }
        },
      ),
    );
  }
}
