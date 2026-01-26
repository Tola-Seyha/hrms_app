import 'package:flutter/material.dart';

class MyInfoListile extends StatelessWidget {
  final String title;
  final IconData? icon;
  // final String subtitle;
  final Widget? subtitle;
  // final TextEditingController? controller;

  const MyInfoListile({
    super.key,
    required this.title,
    required this.icon,
    required this.subtitle,
    // required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
      ), 
      subtitle: subtitle,  
      leading: Icon(icon, color: Colors.black54, size: 24), 
    );
  }
}
 
