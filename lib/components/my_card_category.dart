import 'package:flutter/material.dart';

class MyCardCategory extends StatelessWidget {
  final String name;
  final String jobTitle;
  final String imagPath;
  final String status;
  // final Color? color;
  final Function()? onTap;

  const MyCardCategory({
    super.key,
    required this.name,
    required this.jobTitle,
    required this.imagPath,
    // required this.color,
    required this.status,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: Border(bottom: BorderSide(width: 0.4)),

      onTap: onTap,
      splashColor: Colors.grey.shade300,

      title: Text(
        name,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
      subtitle: Text(
        jobTitle,
        style: TextStyle(fontSize: 12, color: Colors.grey.shade800),
      ),
      leading: Image.asset(imagPath, fit: BoxFit.contain, height: 50),
      trailing: SizedBox(
        width: 115,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 35,
              decoration: BoxDecoration(
                color: Colors.green.shade400,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    status,
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                ),
              ),
            ),
            SizedBox(width: 5),

            Icon(Icons.chevron_right_rounded, size: 30),
          ],
        ),
      ),
    );
  }
}
