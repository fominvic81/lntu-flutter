import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

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
            TextField(
              decoration: const InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.blue,
              ),
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
              style: OutlinedButton.styleFrom(
                minimumSize: Size.fromHeight(50),
              ),
              onPressed: () => {
                Navigator.pop(context),
              },
              child: const Text("back"),
            ),
          ],
        ),
      ),
    );
  }
}
