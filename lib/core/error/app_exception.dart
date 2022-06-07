class AppException implements Exception {
  final String? _message;
  final String? _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix - $_message";
  }
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, "invalid request :");
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? message])
      : super(message, "unauthorized request :");
}

class PageNotFoundException extends AppException {
  PageNotFoundException([String? message]) : super(message, "page not found ");
}
