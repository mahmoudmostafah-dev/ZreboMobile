extension StringExtension on String {
  static final _phoneRegex = RegExp(r'^01[0-2]{1}[0-9]{8}$');
  static final _nameRegex = RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$');

  static final _englishNameRegex = RegExp(r'^[a-zA-Z\s]+$');
  static final _emailRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  static final _numberRegex = RegExp(r'^-?\d+$');

  bool isValidEgyptPhoneNumber() {
    return _phoneRegex.hasMatch(this);
  }

  bool isValidEmail() {
    return _emailRegex.hasMatch(this);
  }

  bool isValidNames() {
    return _nameRegex.hasMatch(this);
  }

  bool isValidNumbers() {
    return _numberRegex.hasMatch(this);
  }
}
