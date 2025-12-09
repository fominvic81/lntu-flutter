import 'package:flutter/material.dart';
import 'package:lntu_flutter/widgets/reset_password_screen.dart';
import 'package:lntu_flutter/widgets/signup_screen.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/flutter.png", width: 200),
            Text("Sign in"),
            TextField(decoration: const InputDecoration(labelText: "Email")),
            TextField(decoration: const InputDecoration(labelText: "Password")),
            OutlinedButton(
              onPressed: () => {
                showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                    title: Text('Not implemented'),
                    content: Text('Not implemented'),
                  ),
                ),
              },
              child: const Text("Sign in"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 20,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupScreen(),
                        ),
                      ),
                    },
                    child: const Text("Sign up"),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResetPasswordScreen(),
                        ),
                      ),
                    },
                    child: const Text("Reset password"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
