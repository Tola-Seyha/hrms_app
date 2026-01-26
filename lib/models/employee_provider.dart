import 'package:flutter/material.dart';
import 'package:hrms_app/models/employee_model.dart';

class EmployeeProvider extends ChangeNotifier {
  EmployeeModel? _selectedEmployee;
  EmployeeModel? get selectedEmp => _selectedEmployee;
  void selectedEmployee(EmployeeModel empDetail) {
    _selectedEmployee = empDetail;
    notifyListeners();
  }
}
