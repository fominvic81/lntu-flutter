import 'package:email_validator/email_validator.dart';

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return "Email is required";
  }
  if (!EmailValidator.validate(value)) {
    return "Email is not valid";
  }
  return null;
}