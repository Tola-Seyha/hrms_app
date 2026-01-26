class EmployeeModel {
  final String imagePath;
  final String name;
  final String status;
  final String jobTitle;
  final String email;
  final String phoneNumber;
  final String location; 
  final String joinDate;
  final String gender;
  EmployeeModel({
    required this.imagePath,
    required this.jobTitle,
    required this.name,
    required this.status,
    required this.email,
    required this.phoneNumber,
    required this.location,
    required this.joinDate,
    required this.gender,
  });
}
