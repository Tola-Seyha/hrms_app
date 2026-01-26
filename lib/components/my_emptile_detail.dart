import 'package:flutter/material.dart';

class MyEmptileDetail extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData? icon;
  const MyEmptileDetail({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 24, color: Colors.black54), 
      title: Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black87,
          fontWeight: FontWeight.w400, 
        ),
      ),
    );
  }
}
