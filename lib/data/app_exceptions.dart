class AppExceptions implements Exception {
  final String _message;
  final String _prefix;

  AppExceptions(this._message, this._prefix);

  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException(String? message)
      : super(message!, "Error during communication : ");
}

class RequestTimeOutException extends AppExceptions {
  RequestTimeOutException(String? message)
      : super(message!, "Request timeout : ");
}

class BadRequestException extends AppExceptions {
  BadRequestException(String? message) : super(message!, "Invalid request : ");
}

class ServerException extends AppExceptions {
  ServerException(String? message)
      : super(message!, "Internal server error : ");
}

class UnauthorizedException extends AppExceptions {
  UnauthorizedException(String? message)
      : super(message!, "Unauthorized request : ");
}

class InvalidInputException extends AppExceptions {
  InvalidInputException(String? message) : super(message!, "Invalid input : ");
}
