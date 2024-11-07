class AppExceptions implements Exception {
  AppExceptions([
    this._message,
    this._prefix,
  ]);
  final _message;
  final _prefix;

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message, "Error During Communication");
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? message]) : super(message, "Invalid Request");
}

class UnauthorisedException extends AppExceptions {
  UnauthorisedException([String? message])
      : super(message, "UnauthorisedException Request");
}
