part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable{
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AppUserChanged extends AuthEvent {
  const AppUserChanged(this.authUser);
  final AuthUser authUser;
  @override
  List<Object> get props => [authUser];
}

class AppSignOutRequested extends AuthEvent{
  const AppSignOutRequested();
}
