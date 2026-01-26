import 'package:flutter/material.dart';
import 'package:hrms_app/components/my_texfield.dart';
import 'package:hrms_app/widgets/widget_tree.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController pwdController = TextEditingController();

    void login() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WidgetTree()),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/image/logo.png", width: 200),
            MyTexfield(
              icon: Icons.mail_lock_outlined,
              type: "Email",
              obscureText: false,
              controller: emailController,
            ),
            SizedBox(height: 20),
            MyTexfield(
              icon: Icons.password,
              type: "Password",
              obscureText: true,
              controller: pwdController,
            ),

            SizedBox(height: 20),

            MaterialButton(
              onPressed: login,
              child: Container(
                padding: EdgeInsets.only(
                  top: 13,
                  bottom: 13,
                  left: 150,
                  right: 150,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text("Log In"),
              ),
            ),

            // FilledButton(onPressed: () {
            //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WidgetTree(),));
            // }, child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
