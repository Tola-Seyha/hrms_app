import 'package:flutter/material.dart';

class MyPaytile extends StatelessWidget {
  final String month;
  final String date;
  final Function()? onTap;

  const MyPaytile({super.key, required this.date, required this.month, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 1.0),
      child: ListTile(
        onTap:  onTap,
        shape: Border(bottom: BorderSide(width: 0.5)),
        // tileColor: Colors.grey.shade100,
        leading: Icon(
          Icons.date_range_outlined,
          size: 30,
          color: Colors.blue.shade600,
        ),
        title: Text(
          month,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        trailing: Icon(Icons.chevron_right_rounded, size: 30),
        subtitle: Text(date, style: TextStyle(fontSize: 14)),
      ),
    );
  }
}
