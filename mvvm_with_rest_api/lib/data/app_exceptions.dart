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

class InternetException extends AppExceptions {
  InternetException([String? message]) : super(message, "Bad Internet");
}

class RequestTimeOut extends AppExceptions {
  RequestTimeOut([String? message]) : super(message, "Invalid Request");
}
