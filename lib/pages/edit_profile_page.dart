import 'package:flutter/material.dart';
import 'package:hrms_app/components/my_edit_textfield_profile.dart';
// import 'package:hrms_app/pages/profile_page.dart';

class EditProfilePage extends StatefulWidget {
  final String firstName; 
  const EditProfilePage({super.key,  
  required this.firstName});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _firstName;
  late TextEditingController _lastName;
  late TextEditingController _phNumber;
  late TextEditingController _gender;
  late TextEditingController _dob;
  late TextEditingController _address;

  @override
  void initState() {
    super.initState();

    _firstName = TextEditingController();
    _lastName = TextEditingController();
    _phNumber = TextEditingController();
    _gender = TextEditingController();
    _dob = TextEditingController();
    _address = TextEditingController();
  }

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _phNumber.dispose();
    _gender.dispose();
    _dob.dispose();
    _address.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("Edit Profile")),
      body: Center(
        child: Expanded(
          child: ListView(
            children: [
              SizedBox(height: 5),
              Divider(thickness: 0.5),
              MyEditTextFieldProfile(
                title: "First Name",
                subtitle: TextField(
                  controller: _firstName, 
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () {
                    setState(() {
                      
                    });
                  },
                  decoration: InputDecoration(
                    
                    prefixIcon: Icon(Icons.person_2_outlined, size: 30),
                    border: WidgetStateInputBorder.resolveWith((states) {
                      states.contains(WidgetState.selected);
                      return UnderlineInputBorder();
                    }),
                  ),
                ),
              ),
               
              Text(_firstName.text),
              MyEditTextFieldProfile( 
                title: "Last Name",
                subtitle: TextField(
                  controller: _lastName,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_2_outlined, size: 30),
                    border: WidgetStateInputBorder.resolveWith((states) {
                      states.contains(WidgetState.selected);
                      return UnderlineInputBorder();
                    }),
                  ),
                ),
              ),
              MyEditTextFieldProfile( 
                title: "Phone Number",
                subtitle: TextField(
                  controller: _phNumber,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone_android_outlined, size: 30),
                    border: WidgetStateInputBorder.resolveWith((states) {
                      states.contains(WidgetState.selected);
                      return UnderlineInputBorder();
                    }),
                  ),
                ),
              ),
              MyEditTextFieldProfile( 
                title: "Gender",
                subtitle: TextField(
                  controller: _gender,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.male_outlined, size: 30),
                    border: WidgetStateInputBorder.resolveWith((states) {
                      states.contains(WidgetState.selected);
                      return UnderlineInputBorder();
                    }),
                  ),
                ),
              ),
              MyEditTextFieldProfile( 
                title: "Date Of Birth",
                subtitle: TextField(
                  controller: _dob,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.date_range_outlined, size: 30),
                    border: WidgetStateInputBorder.resolveWith((states) {
                      states.contains(WidgetState.selected);
                      return UnderlineInputBorder();
                    }),
                  ),
                ),
              ),
              MyEditTextFieldProfile( 
                title: "Address",
                subtitle: TextField(
                  controller: _address,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.location_on_outlined, size: 30),
                    border: WidgetStateInputBorder.resolveWith((states) {
                      states.contains(WidgetState.selected);
                      return UnderlineInputBorder();
                    }),
                  ),
                ),
              ),

              // // MyEditTextFieldProfile (),
              // // Divider(thickness: 0.5,),
              // // MyEditTextFieldProfile(
              // //   title: "First Name",
              // //   subtitle: Text(
              // //     "Seyha",
              // //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              // //   ),
              // //   icon: Icons.person_2_outlined,

              // ),
            ],
          ),
        ),
      ),
    );
  }
}
