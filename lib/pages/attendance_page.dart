import 'package:flutter/material.dart';
import 'package:hrms_app/components/my_card_attendance.dart';
import 'package:hrms_app/components/my_drawer.dart';
import 'package:hrms_app/components/my_leavetile_request.dart';
import 'package:hrms_app/pages/create_leave.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    List leaveHistory = [
      [
        "assets/image/profile.png",
        "Tola Seyha",
        "11/11/2026",
        "Approve",
        Colors.green.shade200,
      ],
      [
        "assets/image/profile.png",
        "Seyha The king",
        "11/11/2026",
        "Approve",
        Colors.green.shade200,
      ],
      [
        "assets/image/profile.png",
        "Seyha The king",
        "11/11/2026",
        "Pending",
        Colors.amber.shade200,
      ],
      [
        "assets/image/profile.png",
        "Seyha The king",
        "11/11/2026",
        "Approve",
        Colors.green.shade200,
      ],
        [
        "assets/image/profile.png",
        "Seyha The king",
        "11/11/2026",
        "Pending",
        Colors.amber.shade200,
      ], 
        [
        "assets/image/profile.png",
        "Seyha The king",
        "11/11/2026",
        "Pending",
        Colors.amber.shade200,
      ], 
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Attendaces",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.notification_important_outlined, size: 30),
          ), 
        ],
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            height: 170,
            decoration: BoxDecoration(
              color: Colors.teal.shade100,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Center(
              child: SizedBox(
                height: 110, 
                child: Row(
                  children: [
                    MyCardAttendance(
                      count: "29",
                      type: "Present",
                      color: Colors.green,
                    ),
                    SizedBox(width: 10),
                    MyCardAttendance(
                      count: "1",
                      type: "Absent",
                      color: Colors.red,
                    ),
                    SizedBox(width: 10),
                    MyCardAttendance(
                      count: "1",
                      type: "Late",
                      color: Colors.amber,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: MaterialButton(
              // hoverColor: Colors.amber,
              shape: Border.all(),
              splashColor: Colors.amber.shade200,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CreateLeave(),));
              },
              child: Container(
                padding: EdgeInsets.only(top: 10, bottom: 10), 
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), 
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.date_range_outlined),
                    SizedBox(width: 10),
                    Text(
                      "Create Leave",
                      style: TextStyle( 
                        fontSize: 16,
                         fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: Text(
                  "Leave Request",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade800,
                  ),
                ),
              ),
            ],
          ),
          Divider(thickness: 0.5),
          Expanded(
            child: ListView.builder(
              itemCount: leaveHistory.length,
              itemBuilder: (context, index) {
                return MyLeavetileRequest(
                  color: leaveHistory[index][4],
                  date: leaveHistory[index][2],
                  name: leaveHistory[index][1],
                  status: leaveHistory[index][3],
                  imagePath: leaveHistory[index][0],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
