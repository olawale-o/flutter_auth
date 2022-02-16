part of 'validation_cubit.dart';


class ValidationState extends Equatable {
  final Email email;
  final Password password;
  final FormzStatus status;
  final String? errorMessage;

  const ValidationState({
    this.email = const Email.pure(),
    this.status = FormzStatus.pure,
    this.password = const Password.pure(),
    this.errorMessage,
  });

  ValidationState copyWith({
    Email? email,
    Password? password,
    FormzStatus? status,
    String? error,
}) {
    return ValidationState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage
    );
}

  @override
  List<Object> get props => [email, password, status];

}