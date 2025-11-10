import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => {Navigator.pop(context)},
      child: const Text("world!"),
    );
  }
}
