import 'package:flutter/material.dart';
import 'package:hrms_app/models/checkin_provider.dart';
import 'package:provider/provider.dart';

class CheckInDetailPage extends StatelessWidget {
  const CheckInDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CheckInProvider>();
    final time = provider.checkInTime;

    return Scaffold(
      appBar: AppBar(title: const Text('Check In Detail')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Status: On Time', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Date: ${DateTime.now().toLocal().toString().split(' ')[0]}'),
            const SizedBox(height: 8),
            Text(
              time != null
                  ? 'Check In Time: ${time.hour}:${time.minute.toString().padLeft(2, '0')}'
                  : 'Check In Time: -',
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                context.read<CheckInProvider>().reset();
                Navigator.pop(context);
              },
              child: const Text('Reset (Demo)'),
            ),
          ],
        ),
      ),
    );
  }
}
