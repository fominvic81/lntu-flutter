import 'package:flutter/material.dart';
import 'package:lntu_flutter/main.dart';
import 'package:lntu_flutter/validators/email.dart';
import 'package:lntu_flutter/validators/password.dart';
import 'package:lntu_flutter/validators/text.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

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
              Text("Sign up"),
              TextFormField(
                controller: _name,
                decoration: const InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
                autovalidateMode: AutovalidateMode.onUnfocus,
                validator: validateText,
              ),
              TextFormField(
                controller: _email,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                autovalidateMode: AutovalidateMode.onUnfocus,
                validator: validateEmail,
              ),
              TextFormField(
                controller: _password,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
                autovalidateMode: AutovalidateMode.onUnfocus,
                validator: validatePassword,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    Map<String, dynamic> data = {'name': _name.text, 'email': _email.text, 'password': _password.text};
                    final response = await dio.post('https://fominvic81.requestcatcher.com/signup', data: data);
                  }
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
      ),
    );
  }
}
