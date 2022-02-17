part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final String username;
  final String token;

  const AuthState({this.token, this.username});

  @override
  List<Object> get props => [token, username];

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'token': token,
    };
  }

  factory AuthState.fromMap(Map<String, dynamic> map) {
    return AuthState(
      username: map['username'] ?? '',
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthState.fromJson(String source) =>
      AuthState.fromMap(json.decode(source));
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthError extends AuthState {
  final String error;

  const AuthError({this.error});

  @override
  List<Object> get props => [];
}

class AuthLogin extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoginLoading extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoginComplete extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLogout extends AuthState {
  @override
  List<Object> get props => [];
}
