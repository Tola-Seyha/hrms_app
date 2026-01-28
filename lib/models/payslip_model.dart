class PayslipModel {
  final String employeeName;
  final DateTime periodStart;
  final DateTime periodEnd;

  // Earnings
  final double basicSalary;
  final double housingAllowance;
  final double transportAllowance;
  final double mealAllowance;
  final double overtime;

  // Deductions
  final double incomeTax;
  final double socialSecurity;
  final double healthInsurance;
  final double pensionContribution;

  // Status
  final String status; // Paid / Pending

  PayslipModel({
    required this.employeeName,
    required this.periodStart,
    required this.periodEnd,
    required this.basicSalary,
    required this.housingAllowance,
    required this.overtime,
    required this.incomeTax,
    required this.socialSecurity,
    required this.status,
    required this.transportAllowance,
    required this.mealAllowance,
    required this.healthInsurance,
    required this.pensionContribution,
  });

  double get grossEarnings =>
      basicSalary + housingAllowance + overtime + transportAllowance + mealAllowance;

  double get totalDeductions =>
      incomeTax + socialSecurity + healthInsurance + pensionContribution;

  double get netSalary =>
      grossEarnings - totalDeductions ;
}
