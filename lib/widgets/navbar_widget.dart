import 'package:flutter/material.dart';
import 'package:hrms_app/models/pages_notifie.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPagesNotifier,
      builder: (context, selectedPage, child) {
        return NavigationBarTheme(
          data: NavigationBarThemeData(
            labelTextStyle: WidgetStateTextStyle.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
              }
              return TextStyle(fontSize: 14);
            }),
          ),

          child: NavigationBar(
            backgroundColor: Colors.amber,
            destinations: [
              NavigationDestination(
                icon: Icon(
                  Icons.home_outlined,
                  size: 30,
                  color: Colors.black87,
                ),
                label: "Home",
                selectedIcon: Icon(Icons.home, size: 30, color: Colors.black87),
              ), 
              NavigationDestination(
                icon: Icon(
                  Icons.watch_later_outlined,
                  size: 30,
                  color: Colors.black87,
                ),
                label: "Attendace",
                selectedIcon: Icon(
                  Icons.watch_later,
                  size: 30,
                  color: Colors.black87,
                ),
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.monetization_on_outlined,
                  size: 30,
                  color: Colors.black87,
                ),
                label: "Payroll",
                selectedIcon: Icon(
                  Icons.monetization_on,
                  size: 30,
                  color: Colors.black87,
                ),
              ),
              NavigationDestination(

                icon: Icon(
                  Icons.person_2_outlined,
                  size: 30,
                  color: Colors.black87,
                ),
                label: "Profile",

                selectedIcon: Icon(
                  Icons.person_2,
                  size: 30,
                  color: Colors.black87,
                ),
              ),
            ],
            onDestinationSelected: (int value) {
              selectedPagesNotifier.value = value;

            },
            indicatorColor: Colors.amber,
            selectedIndex: selectedPage, 
          ),
        );
      },
    ); 
  }
}
