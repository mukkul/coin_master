import 'dart:async';

import 'package:coin_master/features/login/domain/entities/auth_user.dart';
import 'package:coin_master/features/login/domain/usecases/sign_out_usecase.dart';
import 'package:coin_master/features/login/domain/usecases/stream_auth_user_usecase.dart';
import 'package:coin_master/shared/domain/usecases/base_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';
part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final StreamAuthUserUseCase _streamAuthUserUseCase;
  late StreamSubscription<AuthUser> _authUserSubscription;
  final SignOutUseCase _signOutUseCase;
  AuthBloc({
    required StreamAuthUserUseCase streamAuthUserUseCase,
    required AuthUser authUser,
    required SignOutUseCase signOutUseCase,
  })  : _streamAuthUserUseCase = streamAuthUserUseCase,
        _signOutUseCase = signOutUseCase,
        super(authUser == AuthUser.empty
            ? const AuthState.unauthenticated()
            : AuthState.authenticated(
                authUser,
              )) {
    on<AppUserChanged>(_onUserChanged);
    on<AppSignOutRequested>(_onSignOutRequested);
    _authUserSubscription = _streamAuthUserUseCase().listen(_userChanged);
  }

  void _userChanged(AuthUser user) {
    debugPrint('Auth Event: User changed');
    add(AppUserChanged(user));
  }

  void _onUserChanged(
    AppUserChanged event,
    Emitter<AuthState> emit,
  ) {
    return event.authUser.isEmpty
        ? emit(state.copyWith(
            authUser: AuthUser.empty,
            status: AuthStatus.unauthenticated,
          ))
        : emit(state.copyWith(
            authUser: event.authUser,
            status: AuthStatus.authenticated,
          ));
  }

  void _onSignOutRequested(AppSignOutRequested event,
      Emitter<AuthState> emit,){
    unawaited(_signOutUseCase(NoParams()));
  }
}
