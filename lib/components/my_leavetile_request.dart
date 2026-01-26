import 'package:flutter/material.dart';

class MyLeavetileRequest extends StatelessWidget {
  final String name;
  final String date;
  final Color? color;
  final String status;
  final String imagePath;
  const MyLeavetileRequest({
    super.key,
    required this.color,
    required this.date,
    required this.name,
    required this.status,
    required this.imagePath
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // shape: Border(bottom: BorderSide(width: 0.5)), 
      leading: Image.asset(imagePath, height: 45),
      title: Text(name, style: TextStyle(fontSize: 16)),
      subtitle: Text(date, style: TextStyle(fontSize: 12)),
      trailing: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 12,
            right: 12,
            top: 6,
            bottom: 6,
          ),
          child: Text(status, style: TextStyle(fontSize: 14)),
        ),
      ),
    );
  }
}
