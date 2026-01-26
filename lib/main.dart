import 'package:flutter/material.dart';
import 'package:hrms_app/models/employee_provider.dart';
import 'package:hrms_app/pages/login_page.dart';
import 'package:hrms_app/theme/colors.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => EmployeeProvider(),
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
      theme: lightMode,

      // darkTheme: darkMode,
      home: LoginPage(),
    );
  }
}
