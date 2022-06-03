import 'dart:convert';

class ApiException implements Exception {
  final String? _message;
  final String? _prefix;

  ApiException([this._message, this._prefix]);

  dynamic get message => json.decode(_message!);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends ApiException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends ApiException {
  BadRequestException([String? message]) : super(message, "Invalid Request: ");
}

class HeaderMalformedException extends ApiException {
  HeaderMalformedException([String? message])
      : super(message, "Header Malformed: ");
}

class UnauthorisedException extends ApiException {
  UnauthorisedException([String? message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends ApiException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

class AuthenticationException extends ApiException {
  AuthenticationException([String? message])
      : super(message, "Authentication Failed: ");
}
