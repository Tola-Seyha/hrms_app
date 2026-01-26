import 'package:flutter/material.dart';
import 'package:hrms_app/components/my_drawer.dart';
import 'package:hrms_app/components/my_paytile.dart';
import 'package:hrms_app/models/payrol_model.dart';
import 'package:hrms_app/pages/pay_detail.dart';

class PayrollPage extends StatelessWidget {
  const PayrollPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<PayrolModel> payitem = [
      PayrolModel(date: "Jan", month: "01/01/2025 - 02/01/2025"),
      PayrolModel(date: "Feb", month: "02/01/2025 - 03/01/2025"),
      PayrolModel(date: "Mar", month: "03/01/2025 - 04/01/2025"),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payroll",  
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500), 
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
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
          SizedBox(height: 10), 
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PayrollDetail(),));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 14),
              height: 130, 
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.green.shade50,
                border: Border.all(color: Colors.green.shade300)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Net pay this month", 
                    style: TextStyle( 
                      fontSize: 16,  
                      fontWeight: FontWeight.w500, 
                      color: Colors.grey.shade600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0), 
                    child: Divider(thickness: 0.5,),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "2000\$",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.green.shade700,
                    ),
                  ), 
                  // SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("View" , style: TextStyle(color: Colors.blue,  decoration: TextDecoration.underline, decorationColor: Colors.blue, fontSize: 14)),  
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(  
              crossAxisAlignment: CrossAxisAlignment.start, 
              children: [
                Text("Payroll History", style: TextStyle( fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black87),),   
                Divider(thickness:0.5 ,), 
              ],
            ),
          ), 
          Expanded(
            child: ListView.builder(itemCount: payitem.length,itemBuilder: (context, index) {
              return MyPaytile(date: payitem[index].date, month: payitem[index].month);
               
            },),
            // child: ListView(
            //   children: [ 
            //     MyPaytile(
            //       month: "Jan",
            //       date: "12/01/2026 - 12/02/2026",
            //     ),
            //     MyPaytile(
            //       month: "Jan",
            //       date: "12/01/2026 - 12/02/2026",
            //     ),
            //     MyPaytile(
            //       month: "Jan",
            //       date: "12/01/2026 - 12/02/2026",
            //     ), 
            //   ],
            // ),
          )
        
        
        ],
      ),
    );
  }
}
