import 'package:flutter/material.dart';

class MyTexfield extends StatelessWidget {
   final IconData? icon;
  final String type;
  final bool obscureText;
  final TextEditingController? controller;

  const MyTexfield({
    super.key,
    required this.icon,
    required this.type,
    required this.obscureText,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          // hint: Text(""),
          label: Text(type, style: TextStyle(color: Colors.black54)),
          // focusColor: Colors.black,
          prefixIcon: Icon(
            icon,
            size: 24,
            color: Colors.black54,
          ),
          border: WidgetStateInputBorder.resolveWith((states) {
            // if(states.contains(WidgetState.selected));
            return OutlineInputBorder();
          }),
        ),
      ),
    );
  }
}
