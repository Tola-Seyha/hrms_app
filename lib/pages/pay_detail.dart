import 'package:flutter/material.dart';
import 'package:hrms_app/models/payslip_model.dart';

class PayrollDetail extends StatelessWidget {
  final PayslipModel payslip;

  const PayrollDetail({super.key, required this.payslip});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Payroll Detail",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        backgroundColor:  Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20 , left: 20, right: 20),
        child: Column(
          children: [
            // Total Card
            Container(
              width: double.infinity, 
              padding: const EdgeInsets.only(top: 15, bottom: 20 ,left: 10, right: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green.shade200, width: 1),
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0), 
                child: Column(
                  children: [
                    Text(
                      "Net Pay",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Divider(),
                    const SizedBox(height: 8),
                    Text(
                      "\$${payslip.netSalary.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),
            // Earnings
            Row(
              children: [
                Text(
                  "Earning",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Divider(),

            _row("Basic Salary", payslip.basicSalary),
            _row("Housing Allowance", payslip.housingAllowance),
            _row("Transport Allowance", payslip.transportAllowance),
            _row("Meal Allowance", payslip.mealAllowance), 
            _row("Overtime Pay", payslip.overtime),
            Divider(),
            _row("Total", payslip.grossEarnings),
            SizedBox(height: 20),

            // Deductions
            Row(
              children: [
                Text(
                  "Total Deductions",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const Divider(),
            _row("Income Tax", -payslip.incomeTax),
            _row("Social Security", -payslip.socialSecurity),
            _row("Health Insurance", -payslip.healthInsurance),
            _row("Pension Contribution", -payslip.pensionContribution),
            Divider(),
            _row("Total", -payslip.totalDeductions),
            // SizedBox(height: 20),
            Divider(),
            SizedBox(height: 10), 

            // const Spacer(),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.download, color: Colors.black45, size: 20),
              label: const Text(
                "Download Payslip",
                style: TextStyle(color: Colors.black),
              ), 
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),

                backgroundColor: Colors.grey.shade300,
                foregroundColor: Colors.white,
              ),
            ),
            // Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _row(String label, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 16)),
          Text(
            "\$${value.toStringAsFixed(2)}",
            style: TextStyle(
              color: value < 0 ? Colors.red : Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
