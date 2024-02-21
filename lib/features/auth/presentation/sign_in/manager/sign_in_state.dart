part of 'sign_in_bloc.dart';

enum AuthStatus {
  initial,
  loading,
  error,
  logged,
  loggedAndCompleted,
}

class AuthState extends Equatable {
  const AuthState({
    this.user,
    required this.status,
    required this.message,
    required this.code,
  });

  final UserEntity? user;

  final AuthStatus status;
  final String message;
  final int code;

  @override
  List<Object?> get props => [
        user,
        status,
        message,
        code,
      ];

  AuthState copyWith({
    UserEntity? user,
    AuthStatus? status,
    String? message,
    int? code,
  }) {
    return AuthState(
      user: user ?? this.user,
      status: status ?? this.status,
      message: message ?? this.message,
      code: code ?? this.code,
    );
  }
}

class InitialAuthState extends AuthState {
  const InitialAuthState({
    super.status = AuthStatus.initial,
    super.message = '',
    super.code = 000,
  });
}

class ErrorAuthState extends AuthState {
  const ErrorAuthState({
    super.status = AuthStatus.error,
    required super.message,
    required super.code,
  });
}
