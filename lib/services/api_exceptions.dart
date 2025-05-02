class ApiExceptions implements Exception {
  final String? _message;
  final int? errorCode; // Optional error code

  ApiExceptions([this._message, this.errorCode]);

  @override
  String toString() {
    return "${errorCode != null ? '[$errorCode] ' : ''}$_message";
  }
}

// Specific Exception Classes with Shorter Messages
class FetchDataException extends ApiExceptions {
  FetchDataException([message])
      : super(
          message ?? "Connection failed. Try again later.",
        );
}

class BadRequestException extends ApiExceptions {
  BadRequestException([message])
      : super(
          message ?? "Invalid request. Check input and try again.",
        );
}

class UnauthorisedException extends ApiExceptions {
  UnauthorisedException([message])
      : super(
          message ?? "Unauthorized. Please log in again.",
        );
}

class ApiNotFoundException extends ApiExceptions {
  ApiNotFoundException([message])
      : super(
            message ?? "Resource not found.",
        );
}

class InvalidInputException extends ApiExceptions {
  InvalidInputException([message])
      : super(
          message ?? "Invalid input. Check and try again.",
        );
}

class UnprocessableEntityException extends ApiExceptions {
  UnprocessableEntityException([message])
      : super(
          message ?? "Server can't process the request.",
        );
}

class NoContentException extends ApiExceptions {
  NoContentException([message])
      : super(
            message ?? "Request successful, but no content.",
        );
}

class ForbiddenException extends ApiExceptions {
  ForbiddenException([message])
      : super(
          message ?? "Permission denied.",
        );
}

class ConflictException extends ApiExceptions {
  ConflictException([message])
      : super(
          message ?? "Conflict occurred. Try again later.",
        );
}

class InternalServerException extends ApiExceptions {
  InternalServerException([message])
      : super(
          message ?? "Server error. Try again later.",
        );
}

class ServiceUnavailableException extends ApiExceptions {
  ServiceUnavailableException([message])
      : super(
          message ?? "Service unavailable. Try again later.",
        );
}
