import 'package:flutter/material.dart';

class MyCardAction extends StatelessWidget {
  final IconData? icon;
  final String title;
  final void Function()? onTap;
  // final Color? color;
  const MyCardAction({super.key, required this.icon, required this.title, required this.onTap });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container( 
          decoration: BoxDecoration( 
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Theme.of(context).colorScheme.secondary,
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40,  color: Colors.black54,),   
              SizedBox(height: 5),  
              Text(title, style: TextStyle(fontSize: 14)),     
            ],
          ),
        ),
      ), 
    );
  }
}
