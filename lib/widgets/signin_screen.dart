import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:lntu_flutter/main.dart';
import 'package:lntu_flutter/validators/email.dart';
import 'package:lntu_flutter/validators/password.dart';
import 'package:lntu_flutter/widgets/reset_password_screen.dart';
import 'package:lntu_flutter/widgets/signup_screen.dart';
import 'package:dio/dio.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  final _formKey = GlobalKey<FormState>();

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
              Text("Sign in"),
              TextFormField(
                controller: _email,
                decoration: const InputDecoration(labelText: "Email"),
                autovalidateMode: AutovalidateMode.onUnfocus,
                validator: validateEmail,
              ),
              TextFormField(
                controller: _password,
                decoration: const InputDecoration(labelText: "Password"),
                autovalidateMode: AutovalidateMode.onUnfocus,
                validator: validatePassword,
              ),
              OutlinedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    Map<String, dynamic> data = {'email': _email.text, 'password': _password.text};
                    final response = await dio.post('https://fominvic81.requestcatcher.com/signin', data: data);
                  }
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
                            builder: (context) => SignupScreen(),
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
                            builder: (context) => ResetPasswordScreen(),
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
      ),
    );
  }
}
