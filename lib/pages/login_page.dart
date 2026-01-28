import 'package:flutter/material.dart';
import 'package:hrms_app/models/login_model.dart';
import 'package:hrms_app/widgets/widget_tree.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  // void _handleLogin() {
  //   if (_formKey.currentState!.validate()) {
  //     // In a real app, you would send _emailController.text to your backend
  //     // This email is your primary key for tracking the user's session.
  //     print("Tracking user with email: ${_emailController.text}");

  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Logging in as ${_emailController.text}...')),
  //     );
  //   }
  // }

  // Inside _LoginPageState
final MockApiService _apiService = MockApiService();

void _handleLogin() async {
  if (_formKey.currentState!.validate()) {
    // 1. Show loading indicator
    showDialog(context: context, builder: (c) => const Center(child: CircularProgressIndicator()));

    // 2. Call Mock API
    final user = await _apiService.login(_emailController.text, _passwordController.text);

    Navigator.pop(context); // Remove loading indicator

    if (user != null) {
      // 3. Navigate and pass the "tracked" user data
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WidgetTree()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Invalid Credentials")));
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          // Prevents overflow when keyboard appears
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 60),

                // 1. Logo Section (Based on your HRMS branding)
                const Icon(
                  Icons.hub_outlined,
                  size: 80,
                  color: Colors.blue,
                ), // Placeholder for HRMS logo
                const Text(
                  "HRMS",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
                const Text(
                  "Human Resource Management System",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.blueGrey,
                    letterSpacing: 0.5,
                  ),
                ),

                const SizedBox(height: 50),

                // 2. Email Field (User Tracking ID)
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: const Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || !value.contains('@'))
                      return 'Enter a valid corporate email';
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // 3. Password Field
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () =>
                          setState(() => _obscurePassword = !_obscurePassword),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) =>
                      value!.length < 6 ? 'Password too short' : null,
                ),

                const SizedBox(height: 10),

                // Forgot Password Link
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // 4. Login Button (Using your brand yellow)
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: _handleLogin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(
                        0xFFFFC107,
                      ), // Your brand amber/yellow
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 2,
                    ),
                    child: const Text(
                      "Log In",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Footer
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Contact HR"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
