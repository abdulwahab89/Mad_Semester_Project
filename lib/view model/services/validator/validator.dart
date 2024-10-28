class Validator {
  static String? validate(dynamic value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    return null;
  }
}
