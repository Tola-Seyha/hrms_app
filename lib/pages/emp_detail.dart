import 'package:flutter/material.dart';
import 'package:hrms_app/components/my_emptile_detail.dart';
import 'package:hrms_app/models/employee_provider.dart';
import 'package:provider/provider.dart';

class EmployeeDetail extends StatelessWidget {
  const EmployeeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    // List<EmpDetailModel> empDetail = [
    //   EmpDetailModel(subtitle: "mrlucky467@gmail.com"),
    //   EmpDetailModel(subtitle: "086883239"),
    //   EmpDetailModel(subtitle: "Phnom Penh"),
    //   EmpDetailModel(subtitle: "01/"),
    // ];

    final employee = context.watch<EmployeeProvider>().selectedEmp;

    // if (employee == null) {
    //   return const Scaffold(body: Center(child: Text('No employee selected')));
    // }
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          "Employee Detail",  
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton( 
            onPressed: () {},
            icon: Icon(Icons.notification_important_outlined, size: 28), 
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          
          children: [
            Container(
              // height: 300,
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 30),
        
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  CircleAvatar(
                    backgroundColor: Colors.red,
                    maxRadius: 60,
                    child: Image.asset(employee!.imagePath),
                  ),
                  SizedBox(height: 10),
                  Text(
                    employee.name,
                    // "Name",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 10),
                  Text(
                    employee.jobTitle,
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    MyEmptileDetail(
                      title: "Email",
                      subtitle: employee.email,
                      icon: Icons.mail_outline,
                    ), 
                    SizedBox(height: 10),
                    MyEmptileDetail(
                      title: "Phone Number",
                      subtitle: employee.phoneNumber,
                      icon: Icons.phone,
                    ),
                    SizedBox(height: 10),
                    MyEmptileDetail(
                      title: "Gender",
                      subtitle: employee.phoneNumber,
                      icon: Icons.transgender_rounded,
                    ),
                    SizedBox(height: 10),
        
                    MyEmptileDetail(
                      title: "Location",
                      subtitle: employee.location,
                      icon: Icons.location_on_outlined,
                    ),
                    SizedBox(height: 10),
        
                    MyEmptileDetail(
                      title: "Join Date",
                      subtitle: employee.joinDate,
                      icon: Icons.date_range_outlined,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
