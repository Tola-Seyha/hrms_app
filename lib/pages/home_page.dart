import 'package:flutter/material.dart';
import 'package:hrms_app/components/my_card_action.dart';
import 'package:hrms_app/components/recent_activity_model.dart';
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

    final List<Activity> activities = [
      Activity(
        title: "Check In",
        subtitle: "Today",
        time: "08:30 AM",
        status: "On Time",
        statusColor: Colors.green,
        icon: Icons.access_time_filled,
        iconColor: Colors.green,
      ),
      Activity(
        title: "Check Out",
        subtitle: "Yesterday",
        time: "05:45 PM",
        status: "Overtime",
        statusColor: Colors.blue,
        icon: Icons.logout_rounded,
        iconColor: Colors.redAccent,
      ),
      Activity(
        title: "Leave Request",
        subtitle: "24 Jan 2026",
        time: "Annual Leave",
        status: "Approved",
        statusColor: Colors.indigo,
        icon: Icons.event_available,
        iconColor: Colors.indigo,
      ), 
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

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ 
                // Activity List
                ListView.separated(
                  shrinkWrap: true, // Important for use inside a SingleChildScrollView
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: activities.length,
                  separatorBuilder: (context, index) =>
                      const Divider(height: 1, indent: 70),
                  itemBuilder: (context, index) {
                    final item = activities[index];
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      leading: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: item.iconColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(item.icon, color: item.iconColor),
                      ),
                      title: Text(
                        item.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      subtitle: Text(
                        "${item.subtitle} • ${item.time}",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: item.statusColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          item.status,
                          style: TextStyle(
                            color: item.statusColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ), 
          ],
        ),
      ),
    );
  }
}


