class ValidUtils {
  static bool validEmail(String email) {
    final _validator = RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z0-9.-]+$");
    return _validator.hasMatch(email);
  }
}
