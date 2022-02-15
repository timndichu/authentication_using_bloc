part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthError extends AuthState {
  final String error;

  AuthError({this.error});
}

class AuthTokenGenerated extends AuthState {
  final Map<String, String> token;

  AuthTokenGenerated({this.token});
}

class AuthLogin extends AuthState {}
