import 'package:flutter/material.dart';

class CreateLeave extends StatefulWidget {
  const CreateLeave({super.key});

  @override
  State<CreateLeave> createState() => _CreateLeaveState();
}

class _CreateLeaveState extends State<CreateLeave> {
  String name = "Hello";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text(
          "Create Leave",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0), 
            child: DropdownButton(
              padding: EdgeInsets.symmetric(horizontal: 20), 
              value: 1,
              style: TextStyle(fontSize: 20),
              items: [
                DropdownMenuItem(value: 1, child: Text("Sick")),
                DropdownMenuItem(value: 2, child: Text("Hello")),
                DropdownMenuItem(value: 3, child: Text("data")),
                DropdownMenuItem(value: 4, child: Text("data")),
              ],
              onChanged: (value) {},
            ),
          ),

          DropdownButton( 
            // value:  0, 
            items: [
              "Sick ", 
              "Seft busy", 
            ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
