import 'package:flutter/material.dart';

class CheckInProvider extends ChangeNotifier {
  bool _isCheckedIn = false;
  DateTime? _checkInTime;

  bool get isCheckedIn => _isCheckedIn;
  DateTime? get checkInTime => _checkInTime;

  void checkIn() {
    _isCheckedIn = true;
    _checkInTime = DateTime.now();
    notifyListeners();
  }
  void reset() {
    _isCheckedIn = false;
    _checkInTime = null;
    notifyListeners();
  }
}
