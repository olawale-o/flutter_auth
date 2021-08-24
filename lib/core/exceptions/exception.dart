class AuthException implements Exception {
  final String message;
  const AuthException(this.message);
}


class ServerException implements Exception {
  final String message;
  const ServerException(this.message);
}

class NetworkException implements Exception {
  final String message;
  const NetworkException(this.message);
}