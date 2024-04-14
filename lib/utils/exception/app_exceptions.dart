class AppException implements Exception{
  final _message;
  final _prefix;

  AppException([this._prefix, this._message]);

  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class AuthException extends AppException{
  AuthException([String? message]): super("", message);
}