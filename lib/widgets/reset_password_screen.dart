import 'package:flutter/material.dart';
import 'package:lntu_flutter/main.dart';
import 'package:lntu_flutter/validators/email.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
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
                controller: _email,
                decoration: const InputDecoration(labelText: "Email"),
                autovalidateMode: AutovalidateMode.onUnfocus,
                validator: validateEmail,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    Map<String, dynamic> data = {'email': _email.text,};
                    final response = await dio.post('https://fominvic81.requestcatcher.com/reset', data: data);
                  }
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
      ),
    );
  }
}
