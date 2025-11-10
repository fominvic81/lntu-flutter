import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => {Navigator.pop(context)},
      child: const Text("world!"),
    );
  }
}
