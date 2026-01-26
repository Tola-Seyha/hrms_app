import 'package:flutter/material.dart';
import 'package:hrms_app/models/pages_notifie.dart';
import 'package:hrms_app/pages/attendance_page.dart';
import 'package:hrms_app/pages/home_page.dart';
import 'package:hrms_app/pages/payroll_page.dart';
import 'package:hrms_app/pages/profile_page.dart';
import 'package:hrms_app/widgets/navbar_widget.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  List pages = [
    HomePage(),
    // EmployeePage(),
    AttendancePage(),
    PayrollPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      
      valueListenable: selectedPagesNotifier,
      builder: (BuildContext context, dynamic selectedPage, Widget? child) {
        return Scaffold(  
          body: pages.elementAt(selectedPage),
          bottomNavigationBar: NavbarWidget(),
        );
      },
    );
  }
}
