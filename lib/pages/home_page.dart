import 'package:flutter/material.dart';
import 'package:hrms_app/components/my_activity.dart';
import 'package:hrms_app/components/my_card_action.dart';
import 'package:hrms_app/models/checkin_provider.dart';
import 'package:hrms_app/models/pages_notifie.dart';
import 'package:hrms_app/pages/checkin_detail_page.dart';
import 'package:hrms_app/pages/create_leave.dart';
import 'package:hrms_app/pages/scan_checkin_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List activity = [
      [
        "Today",
        "On Time",
        "Check In",
        Icons.watch_later_outlined,
        Colors.green[900],
      ],
      [
        "Today",
        "On Time",
        "Check In",
        Icons.watch_later_outlined,
        Colors.green[900],
      ],
      [
        "Yesterday",
        "On Time",
        "Check In",
        Icons.output_rounded,
        Colors.red.shade300,
      ],
    ];

    // List<OwnerAccModel> ownerAcc = [
    //   OwnerAccModel(image: "assets/image/profile.png", name: "Seyha", id: "EM1222")
    // ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: ValueListenableBuilder(
          valueListenable: selectedPagesNotifier,
          builder: (BuildContext context, dynamic selectedPage, Widget? child) {
            return GestureDetector(
              onTap: () {
                selectedPagesNotifier.value = 3;
              },
              child: Row(
                children: [
                  Image.asset(
                    "assets/image/profile.png",
                    height: 40,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: 7),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Seyha",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "EM0001",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        // title: Image.network(''),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notification_important_outlined, size: 30),
          ),
        ],
      ),
      // drawer: MyDrawer(),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14),
              height: 130,
              child: ValueListenableBuilder(
                valueListenable: selectedPagesNotifier,
                builder: (context, selectedPage, child) {
                  return Row(
                    children: [
                      MyCardAction(
                        icon: Icons.qr_code,
                        title: "Check In", 
                        onTap: () {
                          final isCheckedIn = context
                              .read<CheckInProvider>()
                              .isCheckedIn;

                          if (isCheckedIn) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const CheckInDetailPage(),
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ScanCheckInPage(),
                              ),
                            );
                          }
                        },
                      ),

                      SizedBox(width: 15),

                      MyCardAction(
                        icon: Icons.date_range_outlined,
                        title: "Apply Leave",
                        onTap: () {
                          // selectedPagesNotifier.value = 1;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateLeave(),
                            ),
                          );      
                        },
                        // color: Colors.green[200],
                      ),

                      SizedBox(width: 15),
                      MyCardAction(
                        icon: Icons.payments_outlined,
                        title: "View Payslip",
                        onTap: () {
                          selectedPagesNotifier.value = 2;
                        }, 
                      ),
                    ],
                  );
                },
              ),
              // height: 150, color: Colors.amber
            ),
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Row(
                children: [
                  Text(
                    "Recent Activity",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ], 
              ),
            ),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: activity.length,
                itemBuilder: (context, index) {
                  return MyActivity(
                    status: activity[index][1],
                    time: activity[index][0],
                    type: activity[index][2],
                    icon: activity[index][3],
                    color: activity[index][4],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
