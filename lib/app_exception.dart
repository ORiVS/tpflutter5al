class AppException implements Exception {
  final String? message;

  AppException([this.message]);

  @override
  String toString() => message ?? 'An unknown error occurred';

  static AppException from(dynamic exception) {
    if (exception is AppException) return exception;
    return UnknownException();
  }
}

class UnknownException extends AppException {
  UnknownException() : super('An unknown error occurred');
}
