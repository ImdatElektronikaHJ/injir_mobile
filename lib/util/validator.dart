class Validator {
  Validator._();

  static bool matchPhoneNumber(String value) {
    String patttern = r'(^(?:[+])?[0-9]{11,20}$)';
    RegExp regExp = RegExp(patttern);
    return value.isNotEmpty && regExp.hasMatch(value);
  }

  static bool matchCode(String value) {
    String patttern = r'(^[0-9]{6}$)';
    RegExp regExp = RegExp(patttern);
    return value.isNotEmpty && regExp.hasMatch(value);
  }

  static bool matchNumber(String value) {
    String patttern = r'(^[0-9]$)';
    RegExp regExp = RegExp(patttern);
    return value.isNotEmpty && regExp.hasMatch(value);
  }

  static bool matchEmail(String value) {
    String patttern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
    RegExp regExp = RegExp(patttern);
    return value.isNotEmpty && regExp.hasMatch(value);
  }

  static bool matchAsciiText(String value) {
    String patttern = r'(^[a-zA-Z]+$)';
    RegExp regExp = RegExp(patttern);
    return value.isNotEmpty && regExp.hasMatch(value);
  }

  static bool matchAsciiTextWithSymbols(String value) {
    String patttern = r'(^[\x00-\x7F]+$)';
    RegExp regExp = RegExp(patttern);
    return value.isNotEmpty && regExp.hasMatch(value);
  }
}
