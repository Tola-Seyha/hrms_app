import 'package:flutter/material.dart';

class MyCatecoryEmployee extends StatelessWidget {
  final   Widget? child;
  const MyCatecoryEmployee({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0), 
      child: Container(
        // height: 100,
        decoration: BoxDecoration(
          // color: Colors.amber,
          border: Border.all(color: Theme.of(context).colorScheme.secondary),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center( 
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: child,
          ),
        ),
      ),
    );
  }
}
