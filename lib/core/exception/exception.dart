class BaseException implements Exception {
  final int code;
  final String message;
  const BaseException(this.message, {this.code = 0});

  const BaseException.empty() : this('');

  @override
  String toString() => 'BaseException(code: $code, message: $message)';
}
