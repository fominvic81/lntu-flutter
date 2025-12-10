
String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return "Password is required";
  }
  if (value.length < 7) {
    return "Password should be at least 7 characters long";
  }
  return null;
}
