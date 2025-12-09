import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
            Text("Sign up"),
            TextField(
              decoration: const InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () => {
                showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                    title: Text('Not implemented'),
                    content: Text('Not implemented'),
                  ),
                ),
              },
              child: const Text("Sign up"),
            ),
            OutlinedButton(
              onPressed: () => {Navigator.pop(context)},
              child: const Text("back"),
            ),
          ],
        ),
      ),
    );
  }
}
