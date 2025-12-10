
String? validateText(String? value) {
  if (value == null || value.isEmpty) {
    return "Field is required";
  }
  return null;
}
