import 'package:flutter/material.dart';

class MyEditTextFieldProfile extends StatelessWidget {
  final String title;
  // final TextEditingController? controller;
  final Widget? subtitle;
  const MyEditTextFieldProfile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: subtitle
    );
  }
}
