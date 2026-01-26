import 'package:flutter/material.dart';

class MyActivity extends StatelessWidget {
  final String status;
  final String time;
  final String type;
  final IconData? icon;
  final Color color;
  const MyActivity({
    super.key,
    required this.status,
    required this.time,
    required this.type,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile( 
      shape: Border(bottom: BorderSide(width: 0.5 )), 
      title: Text(
        type,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(time,style: TextStyle(fontSize: 12),),  
      leading: Icon(icon, color: color, size: 30), 
      trailing: Container(  
        width: 90, 
        height: 35, 
        decoration: BoxDecoration(
          color: Colors.green[100],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            status,
            style: TextStyle(fontSize: 14, color: Colors.green[900]),
          ),
        ),
      ),
    );
  }
}
