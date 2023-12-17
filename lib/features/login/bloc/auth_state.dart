part of 'auth_bloc.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthState {
  final AuthStatus status;
  final AuthUser authUser;

  const AuthState({
    required this.status,
    this.authUser = AuthUser.empty,
  });

  const AuthState.authenticated(AuthUser authUser)
      : this(
          status: AuthStatus.authenticated,
          authUser: authUser,
        );

  const AuthState.unauthenticated()
      : this(
          status: AuthStatus.unauthenticated,
        );

  AuthState copyWith({
    AuthStatus? status,
    AuthUser? authUser,
  }) {
    return AuthState(
      status: status ?? this.status,
      authUser: authUser ?? this.authUser,
    );
  }
}
