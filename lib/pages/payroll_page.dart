import 'package:flutter/material.dart';
import 'package:hrms_app/components/my_drawer.dart';
import 'package:hrms_app/models/payslip_model.dart';
import 'package:hrms_app/pages/pay_detail.dart';

class PayrollPage extends StatelessWidget {
  const PayrollPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<PayslipModel> payslips = [
      PayslipModel(
        employeeName: "Tola Seyha",
        periodStart: DateTime(2026, 3, 1),
        periodEnd: DateTime(2026, 4, 31),
        transportAllowance: 500,
        mealAllowance: 300,
        // Earnings
        basicSalary: 2000,  
        housingAllowance: 500,
        overtime: 100,
        //Deductions
        incomeTax: 200,
        socialSecurity: 300,
        healthInsurance: 150,
        pensionContribution: 100, 
        status: "Paid",
      ),
      PayslipModel(
        employeeName: "Tola Seyha",
        periodStart: DateTime(2026, 3, 1),
        periodEnd: DateTime(2026, 3, 31), 
        transportAllowance: 500,
        mealAllowance: 300,
        // Earnings
        basicSalary: 2000, 
        housingAllowance: 500,
        overtime: 100,
        //Deductions
        incomeTax: 200,
        socialSecurity: 300,
        healthInsurance: 150,
        pensionContribution: 100, 
        status: "Paid",
      ),
      PayslipModel(
        employeeName: "Tola Seyha",
        periodStart: DateTime(2026, 1, 1),
        periodEnd: DateTime(2026, 2, 31),
        transportAllowance: 500,
        mealAllowance: 300,
        // Earnings
        basicSalary: 2000,
        housingAllowance: 500,
        overtime: 100, 
        //Deductions
        incomeTax: 200,
        socialSecurity: 300,
        healthInsurance: 150,
        pensionContribution: 100, 
        status: "Paid",
      ),
     
    ];

    double getThisMonthTotal(List<PayslipModel> payslips) {
      final now = DateTime.now();
      return payslips
          .where(
            (p) => 
                p.periodStart.month == now.month &&
                p.periodStart.year == now.year,
          )
          .fold(0.0, (sum, p) => sum + p.netSalary);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payroll",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notification_important_outlined, size: 30),
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 20,
                bottom: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.green.shade200, width: 1),
              ),
              child: Column(
                children: [
                  Text( 
                    "Net pay this month",
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
                    "\$${getThisMonthTotal(payslips).toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Text(
                  "Payslip History", 
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                Divider(thickness: 0.5),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: payslips.length,
              itemBuilder: (context, index) {
                final p = payslips[index];

                return ListTile(
                  leading: const Icon(Icons.calendar_month, color: Colors.blue),
                  title: Text(
                    "${p.periodStart.day}/${p.periodStart.month}/${p.periodStart.year} - "
                    "${p.periodEnd.day}/${p.periodEnd.month}/${p.periodEnd.year}",
                    style: TextStyle(fontSize: 16),
                  ),
                  subtitle: Text(
                    "${p.periodStart.month}/${p.periodStart.year}",
                    style: TextStyle(fontSize: 12),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        p.status,
                        style: TextStyle(
                          fontSize: 14,
                          color: p.status == "Paid" || p.status == "paid"
                              ? Colors.green
                              : Colors.orange,
                        ),
                      ),
                      const Icon(Icons.chevron_right, size: 24),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PayrollDetail(payslip: p),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
