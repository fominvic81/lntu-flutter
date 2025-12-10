import 'package:flutter/material.dart';
import 'package:lntu_flutter/validators/email.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

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
            Text("Reset password"),
            TextFormField(
              decoration: const InputDecoration(labelText: "Email"),
              autovalidateMode: AutovalidateMode.onUnfocus,
              validator: validateEmail,
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
              child: const Text("Reset"),
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
