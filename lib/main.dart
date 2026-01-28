import 'package:flutter/material.dart';
import 'package:hrms_app/models/checkin_provider.dart';
import 'package:hrms_app/models/employee_provider.dart';
import 'package:hrms_app/pages/login_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EmployeeProvider()),
        ChangeNotifierProvider(create: (context) => CheckInProvider()),
      ], 
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: lightMode, 
      // darkTheme: darkMode,
      home: LoginPage(),
    );
  }
}
