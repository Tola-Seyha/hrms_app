import 'package:flutter/material.dart';

class MyNavigate extends StatelessWidget {
  final String title;
  final IconData? icon;
  final void Function()? onPressed;
 
  const MyNavigate({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,

      child: ListTile(
        title: Text(title, style: TextStyle(fontSize: 20)),
        leading: Icon(icon, size: 30),
      ),
    );
  }
}
