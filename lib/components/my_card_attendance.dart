import 'package:flutter/material.dart';

class MyCardAttendance extends StatelessWidget {
  final String count;
  final String type;
  final Color? color;
  const MyCardAttendance({
    super.key,
    required this.count,
    required this.type,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              count,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: color,
              ), 
            ),
            Text(type, style: TextStyle(fontSize: 16, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
