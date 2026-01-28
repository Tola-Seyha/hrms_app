import 'dart:async';

class UserProfile {
  final String email;
  final String name;
  final int annualBalance;

  UserProfile({required this.email, required this.name, required this.annualBalance});
}

class MockApiService {
  // Mock Database
  static final Map<String, UserProfile> _mockUsers = {
    'admin@hrms.com': UserProfile(email: 'admin@hrms.com', name: 'System Admin', annualBalance: 20),  
    'employee@hrms.com': UserProfile(email: 'employee@hrms.com', name: 'John Doe', annualBalance: 12),
    'dev@hrms.com': UserProfile(email: 'dev@hrms.com', name: 'Flutter Dev', annualBalance: 5),
  };

  // Simulate Login and User Tracking
  Future<UserProfile?> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network lag
    
    if (_mockUsers.containsKey(email) && password == "password123") {
      return _mockUsers[email];
    }
    return null;
  }

  // Simulate fetching leave balance for a specific tracked user
  Future<int> getLeaveBalance(String email) async {
    await Future.delayed(const Duration(milliseconds: 800));
    return _mockUsers[email]?.annualBalance ?? 0;
  }

  // Simulate submitting leave
  Future<bool> submitLeave(String email, Map<String, dynamic> leaveData) async {
    await Future.delayed(const Duration(seconds: 1));
    print("LOG: Leave submitted for $email -> $leaveData");
    return true;
  }
}