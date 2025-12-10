import 'package:flutter/material.dart';
import 'package:lntu_flutter/validators/email.dart';
import 'package:lntu_flutter/validators/password.dart';
import 'package:lntu_flutter/validators/text.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

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
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
              autovalidateMode: AutovalidateMode.onUnfocus,
              validator: validateText,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
              autovalidateMode: AutovalidateMode.onUnfocus,
              validator: validateEmail,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
              autovalidateMode: AutovalidateMode.onUnfocus,
              validator: validatePassword,
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
