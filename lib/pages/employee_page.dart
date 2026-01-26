import 'package:flutter/material.dart';
import 'package:hrms_app/components/my_card_category.dart';
import 'package:hrms_app/components/my_drawer.dart';
import 'package:hrms_app/models/employee_model.dart';
import 'package:hrms_app/models/employee_provider.dart';
import 'package:hrms_app/pages/emp_detail.dart';
import 'package:provider/provider.dart';
// import 'package:hrms_app/models/category_model.dart';

class EmployeePage extends StatelessWidget {
  final EmployeeModel? emp;
  const EmployeePage({super.key, this.emp});

  @override
  Widget build(BuildContext context) {
    // List<String> _cat = ["All", "Designer", "Engineering", "HR", "Developer"];
    List<EmployeeModel> catModel = [
      EmployeeModel(
        imagePath: "assets/image/profile.png",
        jobTitle: "Designer",
        name: "Tola Seyha",
        status: "Active",
        email: "mrlucy@gmail.com",
        phoneNumber: "089553696",
        location: "Phnom Penh",
        joinDate: "01/02/2025",
        gender: "Male",
      ),
      EmployeeModel(
        imagePath: "assets/image/profile.png",
        jobTitle: "Engineering",
        name: "Eang Sovanroth",
        status: "Active",
        email: "mrlucy@gmail.com",
        phoneNumber: "089553696",
        location: "Phnom Penh",
        joinDate: "01/02/2025",
        gender: "Male",
      ),
      EmployeeModel(
        imagePath: "assets/image/profile.png",
        jobTitle: "HR",
        name: "Taing Kheang",
        status: "Active",
        phoneNumber: "089553696",
        email: "mrlucy@gmail.com",
        location: "Phnom Penh",
        joinDate: "01/02/2025",
        gender: "Male",
      ),
      EmployeeModel(
        imagePath: "assets/image/profile.png",
        jobTitle: "Developer",
        name: "Tang JungTheng", 
        status: "On leave", 
        email: "mrlucy@gmail.com",
        phoneNumber: "089553696",
        location: "Phnom Penh",
        joinDate: "01/02/2025",
        gender: "Male",
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Employees",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
          // Divider(thickness: 0.5, color: Colors.grey),
          SizedBox(height: 10),
      
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: TextField(
              cursorColor: Colors.grey,
              cursorHeight: 20, 
              style: TextStyle(fontSize: 18, height: 0.5),   
              decoration: InputDecoration(
                hint: Text(
                  "Search Employee...", 
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
      
                border: WidgetStateInputBorder.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10));
                  }
                  return OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  );
                }),
      
                prefixIcon: Icon(
                  Icons.search_rounded,
                  size: 28,  
                  color: Colors.grey.shade700,
                ),
              ),
            ),
          ), 
         
          SizedBox(height: 5),
      
          Divider(thickness: 0.5),
          Expanded(
            child: ListView.builder(
              itemCount: catModel.length,
              itemBuilder: (context, index) {
                final empDetail = catModel[index];
                return MyCardCategory(
                  imagPath: empDetail.imagePath,
                  jobTitle: empDetail.jobTitle,
                  name: empDetail.name,
                  status: empDetail.status,
                  onTap: () {
                    context.read<EmployeeProvider>().selectedEmployee(
                      empDetail,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return EmployeeDetail();
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
