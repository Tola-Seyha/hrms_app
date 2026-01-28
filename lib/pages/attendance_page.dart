import 'package:flutter/material.dart';
import 'package:hrms_app/components/my_card_attendance.dart';
import 'package:hrms_app/components/my_leavetile_request.dart';
import 'package:hrms_app/models/leave_page_model.dart';
import 'package:hrms_app/pages/create_leave.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<LeavePageModel> leaveHistory = [
      LeavePageModel(
        imagePath: "assets/image/profile.png", 
        name: "John Doe",
        date: "2023-08-01",
        status: "Approved",
      ), 
      LeavePageModel(
        imagePath: "assets/image/profile.png", 
        name: "John Doe",
        date: "2023-08-01",
        status: "Approved",
      ), 
      LeavePageModel(
        imagePath: "assets/image/profile.png", 
        name: "John Doe",
        date: "2023-08-01", 
        status: "Rejected", 
      ), 
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Attendaces",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.notification_important_outlined, size: 30),
          ), 
        ],
      ),
      // drawer: MyDrawer(),
      body: Column(
        children: [ 
          Container(
            padding: EdgeInsets.all(20),
            height: 170,
            decoration: BoxDecoration(
               color: Colors.teal.shade300,       
              boxShadow: [
                BoxShadow(
                  color: Colors.teal.shade100,
                  blurRadius: 3, 
                  offset: Offset(0, 1),
                ),
              ],
             
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16), 
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
              // color: Colors.indigo.shade500,
              shape: Border.all(),
              splashColor: Colors. white,
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
                         fontWeight: FontWeight.w500,
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
          Divider(thickness: 1), 
          Expanded(
            child: ListView.builder(
              itemCount: leaveHistory.length,
              itemBuilder: (context, index) {
                final leave = leaveHistory[index];
                return MyLeavetileRequest(
                  color: leave.status == "Approved" || leave.status == "approved"
                      ? Colors.green.shade200
                      : leave.status == "Rejected" || leave.status == "rejected"
                          ? Colors.amber.shade200
                          : Colors.red,
                  date: leave.date,
                  name: leave.name,
                  status: leave.status,
                  imagePath: leave.imagePath,
                ); 
              },
            ),
          ),
        ],
      ),
    );
  }
}