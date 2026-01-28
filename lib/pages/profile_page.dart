import 'package:flutter/material.dart';
import 'package:hrms_app/components/my_info_listile.dart';
import 'package:hrms_app/models/pages_notifie.dart';
import 'package:hrms_app/pages/edit_profile_page.dart';
import 'package:hrms_app/pages/login_page.dart';

class ProfilePage extends StatelessWidget {
  // final String? firstName;
  const ProfilePage({
    super.key,
    //  required  this.firstName
  });

  @override
  Widget build(BuildContext context) {
    // TextEditingController _firstName  = TextEditingController(text: firstName); 
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Profile "),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 60,

            child: ValueListenableBuilder(
              valueListenable: selectedPagesNotifier,
              builder:
                  (BuildContext context, dynamic selecetedPage, Widget? child) {
                    return GestureDetector(
                      onTap: () {
                        selectedPagesNotifier.value = 0;
                      },
                      child: Image.asset("assets/image/logo.png"),
                    );
                  },
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            // Divider(thickness: 0),
            // SizedBox(height: 20,),
            SizedBox(height: 20),
            SizedBox(
              height: 100,
              // color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    child: Image.asset("assets/image/profile.png"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              // height: 50,
              width: double.infinity,
              color: Colors.grey.shade200,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  left: 14,
                  right: 14,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Account Information", style: TextStyle(fontSize: 16)),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                EditProfilePage(firstName: "aass"),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 15,
                          right: 15,
                          top: 3,
                          bottom: 3,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Edit",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue.shade500,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(height: 5),
                  MyInfoListile(
                    title: "First Name",
                    subtitle: Text(
                      "Seyha",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    icon: Icons.person_2_outlined,
                  ),
                  MyInfoListile(
                    title: "First Name",
                    subtitle: Text(
                      "Tola",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    icon: Icons.person_2_outlined,
                  ),
                  MyInfoListile(
                    title: "Phone Number",
                    subtitle: Text(
                      "089553696",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    icon: Icons.phone,
                  ),
                  MyInfoListile(
                    title: "Gender",
                    subtitle: Text(
                      "Male",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    icon: Icons.male,
                  ),
                  MyInfoListile(
                    title: "Date Of Birth",
                    subtitle: Text(
                      "01/02/1975",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    icon: Icons.date_range_outlined,
                  ),
                  MyInfoListile(
                    title: "Address",
                    subtitle: Text(
                      "Phnom Penh",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    icon: Icons.location_pin,
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: MaterialButton(
                      color: Colors.red.shade400, 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginPage();
                            },
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          "Log Out",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
