import 'package:flutter/material.dart';

import 'package:hrms_app/pages/login_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer( 
      backgroundColor: Colors.grey.shade50, 
      // elevation: 20,
      // width: 200,  
      child: SafeArea( 
        child: Column(
          children: [
            SizedBox(height: 40),
            Image.asset("assets/image/logo.png", width: 150),
            SizedBox(height: 20),
            // MyNavigate(
            //   title: "Home",
            //   icon: Icons.home,
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            // ),
            // MyNavigate(
            //   title: "Team",
            //   icon: Icons.people,
            //   onPressed: () {
            //     Navigator.pop(context);
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) {
            //           return EmployeePage();
            //         },
            //       ),
            //     );
            //   },
            // ),
            // MyNavigate(
            //   title: "Profile",
            //   icon: Icons.person,
            //   onPressed: () {
            //     Navigator.pop(context);
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) {
            //           return ProfilePage();
            //         },
            //       ),
            //     );
            //   },
            // ),
            // Spacer(),
         
            MaterialButton(
              color: Colors.red.shade400,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onPressed: () { 
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              }, 
              child: Text("Log Out", style: TextStyle(color: Colors.white)),
            ),
            // Spacer(),
              //  SizedBox(height: 50,),
          ], 
        ),
      ),
    );
  }
}
