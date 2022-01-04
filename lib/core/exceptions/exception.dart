class AuthException implements Exception {
  final String message;
  const AuthException(this.message);

  factory AuthException.fromCode(String code) {
    switch(code) {
      case 'user-not-found':
        return const AuthException('No user found for that email.');
      case 'wrong-password':
        return const AuthException('Wrong password provided for that user.');
      case 'account-exists-with-different-credential':
        return const AuthException(
          'Account exists with different credentials.',
        );
      case 'invalid-credential':
        return const AuthException(
          'The credential received is malformed or has expired.',
        );
      case 'operation-not-allowed':
        return const AuthException(
          'Operation is not allowed.  Please contact support.',
        );
      case 'user-disabled':
        return const AuthException(
          'This user has been disabled. Please contact support for help.',
        );
      case 'invalid-verification-code':
        return const AuthException(
          'The credential verification code received is invalid.',
        );
      case 'invalid-verification-id':
        return const AuthException(
          'The credential verification ID received is invalid.',
        );
      case 'invalid-email':
        return const AuthException(
          'Email is not valid or badly formatted.',
        );
      case 'email-already-in-use':
        return const AuthException(
          'An account already exists for that email.',
        );
      case 'weak-password':
        return const AuthException(
          'Please enter a stronger password.',
        );
      default:
        return const AuthException('');
    }
  }
}


class ServerException implements Exception {
  final String message;
  const ServerException(this.message);
}

class NetworkException implements Exception {
  final String message;
  const NetworkException(this.message);
}