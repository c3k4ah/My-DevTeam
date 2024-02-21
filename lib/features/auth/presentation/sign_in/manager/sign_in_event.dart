part of 'sign_in_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class CheckIsAuthenticatedAuthEvent extends AuthEvent {}

class FetchUserAuthEvent extends AuthEvent {}

class LoginAuthEvent extends AuthEvent {}

class ResetAuthStateEvent extends AuthEvent {}

class LoginWithGoogleEvent extends AuthEvent {}

class LoginWithFacebookEvent extends AuthEvent {}

class LoginWithTelEvent extends AuthEvent {}

class ChangedAuthAtatusEvent extends AuthEvent {
  final AuthStatus status;

  const ChangedAuthAtatusEvent(this.status);

  @override
  List<Object> get props => [status];
}

class GetProfileEvent extends AuthEvent {
  final String id;

  const GetProfileEvent(this.id);

  @override
  List<Object> get props => [id];
}
